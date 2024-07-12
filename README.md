# kizaru-warp

<img src="https://github.com/user-attachments/assets/48412c28-805d-443f-b734-800ffb671455" alt="kizaru-warp project banner and logo" width=1000px />

## Setup


1. Download `kizaru-warp.sh` and place it somewhere on your system
2. Add this at the end of your shell init file (`.bashrc` with bash, `.zshrc` with zsh, etc.):
```shell
source /path/to/kizaru-warp.sh

export KIZ_WARP_CFG=$XDG_CONFIG_HOME/.config/kizaru-warp

alias jj='kizaru-warp --awakened'
```
3. Download `locations.txt` and `all_locations.txt` and place them in `$KIZ_WARP_CFG` dir.
4. *OPTIONAL:* Create two custom aliases:
```shell
alias j='kizaru-warp'
alias jj='kizaru-warp --awakened'
```

## Usage

```shell
# Examples:
$ kizaru-warp # Normal mode with interactive fzf selection
$ kizaru-warp dl # Normal mode with instant navigation to `dl` entry
$ kizaru-warp -a # Awakened mode with interactive fzf selection
$ kizaru-warp -a dl # Awakened mode with best effort fzf auto selection
```
