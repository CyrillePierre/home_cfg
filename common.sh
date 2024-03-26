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
	rsync -a --info=NAME --backup-dir="$backup_dir" "$1" "$path_dest"
}
