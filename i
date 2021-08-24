#!/usr/bin/env bash

case $OSTYPE in
  darwin*)
    BASHRC=".bash_profile"
    BASHBK=".bashrc"
    ;;
  *)
    BASHRC=".bashrc"
    BASHBK=".bash_profile"
    ;;
esac

SOURCENAME="bash-config.sh"
FILENAME=".bash-config"

cp $SOURCENAME $HOME/$FILENAME

if grep -q "# installed bash-config" "$HOME/$BASHRC"; then
  echo "already bash-config installed"
else
  echo "# installed bash-config" >> $HOME/$BASHRC
  echo "source $HOME/$FILENAME" >> $HOME/$BASHRC
  echo "bash-config installed"
fi

source $HOME/$FILENAME

if grep -q "# custom configure" "/etc/hosts"; then
  echo "already setting hosts"
else
  echo "# custom configure" >> /etc/hosts
  echo "cs.creco.me cs" >> /etc/hosts
  echo "/etc/hosts modified"
fi

cp $HOME/$BASHRC $HOME/$BASHBK
