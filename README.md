## Setup

```sh
git clone --recurse-submodules git@github.com:quot/configs.git tempConfig \
&& mv ./tempConfig/* ./tempConfig/.git* ~/.config/ \
&& rm -rf ./tempConfig \
&& ln -s ~/.config/zsh/zshrc ~/.zshrc
```

### Git
`if [ -f ~/.gitconfig ]; then mv ~/.gitconfig ~/.gitconfig.BAK; fi && cd ~/.config && git submodule update --init --recursive && ln -s ~/.config/git/global.gitconfig ~/.gitconfig`

## Prereqs

### Wezterm
`brew tap homebrew/cask-fonts && brew install --cask font-monaspace font-hack-nerd-font`
