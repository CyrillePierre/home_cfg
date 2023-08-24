cfg_fzf_dir='/opt/fzf'

if [ -d "${cfg_fzf_dir}" ] ; then
  local fzf_regfile_preview_command='bat --theme=gruvbox-dark --style=numbers --color=always {}'
  local fzf_dir_preview_command='fd --color=always --maxdepth 2 . {}'
  export FZF_PREVIEW_COMMAND="(${fzf_regfile_preview_command} || ${fzf_dir_preview_command})"
  export FZF_COMPLETION_OPTS="--preview '${FZF_PREVIEW_COMMAND} 2>/dev/null'"
  export FZF_CTRL_T_OPTS="--preview '${FZF_PREVIEW_COMMAND} 2>/dev/null'"
  export FZF_ALT_C_OPTS="--preview '${fzf_dir_preview_command} 2>/dev/null'"

  source "${cfg_fzf_dir}/shell/completion.zsh"
  source "${cfg_fzf_dir}/shell/key-bindings.zsh"

  _fzf_compgen_path() {
    fd --hidden --follow --exclude ".git" . "$1"
  }

  # Use fd to generate the list for directory completion
  _fzf_compgen_dir() {
    fd --type d --hidden --follow --exclude ".git" . "$1"
  }

fi

unset cfg_fzf_dir
