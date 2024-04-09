#!/bin/bash
if [[ -z "$1" ]] ; then
  backup_dir_model='/tmp/backup_home_XXXXXX'
  backup_dir="$(mktemp -d "$backup_dir_model")"
  echo "backup dir: $backup_dir"
else
  backup_dir="$1"
fi

install_config() {
  path_dest="$HOME/$2"
  create_link='false'

  if [[ -e "$path_dest" ]] ; then
    if [[ -z "$(find "$path_dest" -type l)" ]] ; then
      mkdir -p "$(dirname "$backup_dir/$2")"
      mv "$path_dest" "$backup_dir/$2"
      create_link='true'
    fi
  else
    dest_dir=$(dirname $path_dest)
    if [[ ! -e "$dest_dir" ]] ; then
      mkdir -p "$dest_dir"
    fi

    create_link='true'
  fi

  if [[ "$create_link" = 'true' ]] ; then
    echo -n "  - "
    ln -vfsr "$1" "$path_dest"  
  fi
}
