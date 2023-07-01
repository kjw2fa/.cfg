# What is this for?
This repository contains my configurations for:
- vim
- tmux
- fish shell

This file explains step by step how to set up everything on a new device,
including downloading programs necessary to support these configurations. No
symlinking is required to get this up and running.

# Installation

## Installing git
1. Check if git is already installed using

```
git version
```

2. Install git

   - If your device is using MacOS
      - download [homebrew](https://docs.brew.sh/Installation) which is a package manager
      - Install git with
      ```
      brew install git
      ```
   - If your device is running a different OS look up how to install
   [git](https://github.com/git-guides/install-git)

## Installing this repository
Installing the configurations does not require any symlinking. The configuration
files should be downloaded to their expected locations.

This installation process is from
[here](https://www.ackama.com/what-we-think/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained/)
and [here](https://www.atlassian.com/git/tutorials/dotfiles).

### Commands for installation
```
git clone --bare https://github.com/kjw2fa/.cfg.git $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config checkout
config config --local status.showUntrackedFiles no
```

### Explanation of steps
1. Clone the repository
2. Create an alias "config" that can be used for git commands on the repository
3. Checkout the files from the repository. There may be conflicts with existing
files at this stage which will need to be resolved.
4. Since the repository's working tree is the entire file system, all of the
existing files will show up as untracked files. This command ignores them so
only files from the repository are tracked.

### How to update this git repository
Use the alias "config" in place of "git" to run git commands. For example

```
git push
```

should instead be

```
config push
```

The alias "config" is set in .config/fish/config.fish

## Fish shell

1. Add the fish shell /usr/local/bin/fish to /etc/shells with:

```
echo /usr/local/bin/fish | sudo tee -a /etc/shells
```

2. Change your default shell to fish with:

```
chsh -s /usr/local/bin/fish
```
[Fish
tutorial](https://fishshell.com/docs/3.0/tutorial.html#tut_switching_to_fish)
 if that doesn't work

## VIM
After installing the repository, you can install the required vim plugins by:
1. Open [.vimrc](.vimrc) which should be in your home folder. Instructions for
   installation should also be in the file.

```
vim ~/.vimrc
```

2. Install Vundle, a package manager for vim
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
3. Run the ex command :PluginInstall to install all plugins
4. Use the :so % vim ex command to source .vimrc

Now vim keybindings should be set up. However, there may be issues with the
themes. This can be resolved in the Terminal Themes and Fonts section.

## TMUX
After installing the repository, you can download the required plugins by:

1. Download TMux Package Manager

```
 git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

2. Download the plugins
   - Run the command to download the plugins
   ```
   cd ~/.tmux/plugins/tpm/scripts && ./install_plugins.sh
   ```

   - Alternatively, download the plugs from .tmux.conf
      - open [.tmux.conf](.tmux.conf) which should be in your home folder.
      ```
      vim ~/.tmux.conf
      ```
      - move your cursor to the plugins, and use the tmux prefix + I. The tmux prefix
      could be ctrl b or ctrl space if you have already sourced the tmux file.

3. Source the tmux file with

```
tmux source ~.tmux.conf
```

Now tmux should mostly be set up, but there may be some issues with the themes.
This can be resolved in the Terminal Themes and Fonts section.

## Terminal Themes and Fonts

### Themes
To use the Nord theme it must be enabled in your terminal.

1. Download the correct [port](https://www.nordtheme.com/ports) for your terminal.
2. Enable the theme in your terminal preferences

For iterm2, follow the instructions in the [nord iterm2
repo](https://github.com/nordtheme/iterm2)

### Fonts

1. Add the cask-fonts repo

```
brew tap homebrew/cask-fonts
```

2. Install the font you want from cask-fonts. This example installs Hack
   font

```
brew install font-hack-nerd-font
```

3. Select the new font in Settings > Profiles > Text > Fonts

# TODO
- [ ] Write a start up script to automate these commands
- [ ] Figure out how to keep read me in the bare git repo
