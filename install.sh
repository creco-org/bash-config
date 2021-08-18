#!/usr/bin/env bash

case $OSTYPE in
  darwin*)
    BASHRC=".bash_profile"
    ;;
  *)
    BASHRC=".bashrc"
    ;;
esac

SOURCENAME="bash-config.sh"
FILENAME=".bash-config"

cp $SOURCENAME $HOME/$FILENAME

if grep -q "# installed bash-config" "$HOME/$BASHRC"; then
  echo "already installed bash-config"
  grep "# installed bash-config" "$HOME/$BASHRC"
else
  echo "# installed bash-config" >> $HOME/$BASHRC
  echo "source $HOME/$FILENAME" >> $HOME/$BASHRC
  echo "bash-config on."
fi

