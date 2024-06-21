# Oh my home

- [pyenv](https://github.com/pyenv/pyenv)
- [pyenv-virtualenv](https://github.com/pyenv/pyenv-virtualenv)
- [starship](https://starship.rs/)
- [Oh my zsh](https://ohmyz.sh/#install)
- [fzf](https://github.com/junegunn/fzf)
- [fzf-tab](https://github.com/Aloxaf/fzf-tab)
- [batcat](https://github.com/sharkdp/bat)
- [zoxide](https://github.com/ajeetdsouza/zoxide)
- [shellfirm](https://github.com/kaplanelad/shellfirm)
- [fd](https://github.com/sharkdp/fd)
- [eza](https://eza.rocks/)
- [Fortune-mod](https://github.com/shlomif/fortune-mod)
- [The Fuck](https://github.com/nvbn/thefuck)

## Installation
```shell
sudo apt get update
# OH MY ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Add shellfirm to conf.d fishshell folder
curl https://raw.githubusercontent.com/kaplanelad/shellfirm/main/shell-plugins/shellfirm.plugin.zsh -o ~/.shellfirm-plugin.sh
# LOLCAT
sudo apt install lolcat --fix-missing
# FD
sudo apt install fd-find
# EZA
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza
# THEFUCK
sudo apt update
sudo apt install python3-dev python3-pip python3-setuptools
pip3 install thefuck --user
```
