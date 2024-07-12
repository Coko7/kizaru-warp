#!/usr/bin/env bash

# Set env
export KIZ_WARP_CFG="${KIZ_WARP_CFG:-$XDG_CONFIG_HOME/kizaru-warp}"
export KIZ_WARP_LOC="${KIZ_WARP_LOC:-$KIZ_WARP_CFG/locations.txt}"
export KIZ_WARP_LOC_A="${KIZ_WARP_LOC_A:-$KIZ_WARP_CFG/all_locations.txt}"

kizaru_warp() {
    # Display help if "--help" or "-h" supplied
    if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
        echo "Usage: kizaru_warp [OPTION] [DESTINATION]"
        echo "Attempts to change directory to DESTINATION"
        echo "Supply no [DESTINATION] to use in interactive mode (fzf)"
        echo "Awakened mode allows to warp to more locations"
        echo "Example: kizaru_warp downloads\n"
        echo "Options:"
        echo "\t-a, --awakened      allows to warp to more locations"
        echo "\t-h, --help          display this help text and exit"      
        echo "\t-v, --version       display version information and exit"
        return 0
    fi

    if [ "$1" = "--version" ] || [ "$1" = "-v" ]; then
        echo "kizaru_warp 0.1"
        echo "kizaru_warp is an upgrade of my old jump-dir CLI"
        return 0
    fi

    # Process mode (either Normal or Awakened)
    input=""
    if [ "$1" = "--awakened" ] || [ "$1" = "-a" ]; then
        is_awakened=true

        if [ $# -gt 2 ]; then
            >&2 echo "kizaru_warp (a): Too many arguments, see: kizaru_warp --help"
            return 1
        fi

        if [ $# -eq 2 ]; then
            input="$2"
        fi
    else
        is_awakened=false

        if [ $# -gt 1 ]; then
            >&2 echo "kizaru_warp (n): Too many arguments, see: kizaru_warp --help"
            return 1
        fi

        if [ $# -eq 1 ]; then
            input="$1"
        fi
    fi

    if [ "$is_awakened" = false ]; then
        locations=`cat $KIZ_WARP_LOC | envsubst`

        # If no arg supplied, go into interactive mode with fzf
        if [ -z "$input" ]; then
            pick=`echo $locations | fzf`
            if [ $? != 0 ]; then
                # echo "kizaru_warp failed: no warp location selected"
                return 1
            fi
        else
            pick=`echo $locations | grep "^$input:"`
            if [ $? != 0 ]; then
                >&2 echo "kizaru_warp (n): no entry found for key '$input'"
                return 1
            fi
        fi

        dest=`echo $pick | cut -d':' -f2 | tr -d '[:blank:]'`
    else
        # If $input is set, then fzf will not be launched interactively
        fzf_filter_suffix=""
        if [ -n "$input" ]; then
            fzf_filter_suffix="-f $input"
        fi

        # Find all subdirs of dirs from the jumps_file and hide errors from output
        all_locations=`find $(cat $KIZ_WARP_LOC_A | envsubst) -mindepth 1 -maxdepth 1 -type d 2>/dev/null`
        # NOTE: Had a lot of trouble with the find command in zsh, see:
        # - https://unix.stackexchange.com/questions/417629/pass-a-list-of-directories-stored-in-a-file-to-find-command
        # - https://stackoverflow.com/questions/73206662/executing-find-command-with-a-file-having-directory-list
        # Starting with GNU findutils 4.9.0, the more reliable `file0-from` argument may be used
        # to pass a list of starting points to the find command. See:
        # - https://lists.gnu.org/archive/html/info-gnu/2022-02/msg00003.html

        # Use fzf to find a destination and only keep the first match if several results
        dest=`echo $all_locations | fzf $fzf_filter_suffix | head -n 1`
    fi

    if [ -z $dest ]; then
        return 1
    fi

    cd $dest
}
