#!/bin/bash
print_help() {
  cat >&2 <<EOF
Syntax: $0 [OPTION]...

  -b, --backup-dir=PATH   use PATH as backup directory instead of generating one
  -h, --help              print this help
  -s, --sudo              specify that sudo is available and use it to install programs
  -c, --config-only       only install config files, no programs
EOF
  exit 0
}

install_config() {
  local path_dest="$HOME/$2"
  local create_link='false'

  if [[ -e "$path_dest" ]] ; then
    if [[ -z "$(find "$path_dest" -type l)" ]] ; then
      mkdir -p "$(dirname "$BACKUP_DIR/$2")"
      mv "$path_dest" "$BACKUP_DIR/$2"
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
    echo -n "  "
    ln -vfsr "$1" "$path_dest"  
  fi
}

generate_backup_dir() {
  local backup_dir_model='/tmp/backup_home_XXXXXX'
  BACKUP_DIR="$(mktemp -d "$backup_dir_model")"
  echo "backup dir: $BACKUP_DIR"
}

github_release_version() {
  repo="$1"
  curl -s "https://api.github.com/repos/${repo}/releases/latest" | jq -r '.tag_name'
}

options=$(getopt -o hb:cs -l help,backup-dir:,sudo,config-only -n "$0" -- "$@")
eval set -- "$options"

ARGS=("$@")
BACKUP_DIR=
INSTALL_WITH_SUDO=
CONFIG_ONLY=

while true ; do
  case "$1" in
    -h ) print_help ;;
    -b | --backup-dir ) BACKUP_DIR=$2 ; shift 2 ;;
    -s | --sudo ) INSTALL_WITH_SUDO=1 ; shift ;;
    -c | --config-only ) CONFIG_ONLY=1 ; shift ;;
    -- ) shift ; break ;;
    * ) echo >&2 "Error: Unknown option '$1'." ; exit 1 ;;
  esac
done

if [[ ! "$BACKUP_DIR" ]] ; then
  generate_backup_dir
fi
