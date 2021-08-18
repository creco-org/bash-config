#!/usr/bin/env bash

BASHRC=".bashrc"
FILENAME=".bash-config"

#if [ -f "$HOME/$FILENAME" ] ; then
#  echo "already installed"
#  ls -al $HOME/$FILENAME
#else
cp ./$FILENAME $HOME
#  echo "bash-config installed"
#fi

if grep -q "# installed bash-config" "$HOME/$BASHRC"; then
  echo "already installed bash-config"
  grep "# installed bash-config" "$HOME/$BASHRC"
else
  echo "# installed bash-config" >> $HOME/$BASHRC
  echo "source ~/$FILENAME" >> $HOME/$BASHRC
  echo "bash-config on."
fi

