# kizaru-warp

<img src="https://github.com/user-attachments/assets/48412c28-805d-443f-b734-800ffb671455" alt="kizaru-warp project banner and logo" width=1000px />

## Setup

1. This CLI requires [junegunn/fzf](https://github.com/junegunn/fzf) to be installed in order to function properly. Make sure to install it first before continuing
2. Download `kizaru-warp.sh` and place it somewhere on your system
3. Add this at the end of your shell init file (`.bashrc` with bash, `.zshrc` with zsh, etc.):
```shell
source /path/to/kizaru-warp.sh
export KIZ_WARP_CFG=$XDG_CONFIG_HOME/.config/kizaru-warp
```
4. Download `locations.txt` and `all_locations.txt` and place them in `$KIZ_WARP_CFG` dir.
5. *OPTIONAL:* Create two custom aliases:
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
