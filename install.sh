SCRIPTDIR=$(cd `dirname $0` && pwd)
cd $SCRIPTDIR

mkdir -p ~/.ssh

if ! command -v stow > /dev/null; then
  if command -v apt-get > /dev/null; then
    echo "installing stow"
    apt-get update && apt-get install -y stow
  else
    echo "cannot find stow and can't install it"
  fi
fi

echo "creating symlinks"
stow git
stow emacs
stow vim
stow fish
stow screen
