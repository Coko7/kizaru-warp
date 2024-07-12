# kizaru_warp

<img src="https://github.com/user-attachments/assets/48412c28-805d-443f-b734-800ffb671455" alt="kizaru_warp project banner and logo" width=1000px />

`kizaru_warp` is a tiny cli that relies on fzf to help you move around your file system ***blazingly flast!!!***

## Setup

1. This CLI requires [junegunn/fzf](https://github.com/junegunn/fzf) to be installed in order to function properly. Make sure to install it first before continuing
2. Download `kizaru_warp.sh` and place it somewhere on your system
3. Add this at the end of your shell init file (`.bashrc` with bash, `.zshrc` with zsh, etc.):
```shell
source /path/to/kizaru_warp.sh
```
4. Download `locations.txt` and `all_locations.txt` and put them in `$HOME/.config/kizaru_warp/` or whatever `$KIZ_WARP_CFG` points to.
5. *RECOMMENDED:* Create two custom aliases:
```shell
alias j='kizaru_warp'
alias jj='kizaru_warp --awakened'
```

## Usage

```shell
# Examples:
$ kizaru_warp # Normal mode with interactive fzf selection
$ kizaru_warp dl # Normal mode with instant navigation to `dl` entry
$ kizaru_warp -a # Awakened mode with interactive fzf selection
$ kizaru_warp -a dl # Awakened mode with best effort fzf auto selection
```
