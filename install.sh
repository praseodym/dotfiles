SCRIPTDIR=$(cd `dirname $0` && pwd)
cd $SCRIPTDIR

mkdir -p ~/.ssh

stow git
stow emacs
stow vim
stow fish
stow screen
