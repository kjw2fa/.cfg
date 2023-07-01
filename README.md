################################################################################
## VUNDLE PLUGIN MANAGER
################################################################################

Installation
git clone --bare https://github.com/kjw2fa/.cfg.git $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config checkout
config config --local status.showUntrackedFiles no


Explanation of steps
1. Clone the repository
2. Create an alias "config" that can be used for git commands on the repository
3. Checkout the files from the repository. There may be conflicts with existing
files at this stage which will need to be resolved.
4. Since the repository's working tree is the entire file system, all of the
existing files will show up as untracked files. This command ignores them so
only files from the repository are tracked.
