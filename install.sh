SCRIPTDIR=$(cd `dirname $0` && pwd)

if [ -e ~/.zshrc ]; then
	mv ~/.zshrc ~/.zshrc~
fi

cd $SCRIPTDIR

git submodule update --init --recursive

HOSTNAME=$(hostname)

mkdir -p ~/.ssh

ln -fs $SCRIPTDIR/zsh/zshrc.sh ~/.zshrc
ln -fs $SCRIPTDIR/git/gitconfig ~/.gitconfig
ln -fs $SCRIPTDIR/emacs/emacs ~/.emacs
stow vim
stow fish
ln -fs $SCRIPTDIR/sbt/sbtconfig ~/.sbtconfig
ln -fs $SCRIPTDIR/screen/screenrc ~/.screenrc

if [ -e /usr/bin/xmonad ]; then
    mkdir -p ~/.xmonad
    ln -fs $SCRIPTDIR/xmonad/xmonad.hs ~/.xmonad/xmonad.hs
    ln -fs $SCRIPTDIR/xmonad/xmobarrc ~/xmobarrc
fi
