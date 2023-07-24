cfg_fzf_dir='/opt/fzf'

if [ -d "${cfg_fzf_dir}" ] ; then
  source "${cfg_fzf_dir}/shell/completion.zsh"
  source "${cfg_fzf_dir}/shell/key-bindings.zsh"

  # Use fd (https://github.com/sharkdp/fd) instead of the default find
  # command for listing path candidates.
  # - The first argument to the function ($1) is the base path to start traversal
  # - See the source code (completion.{bash,zsh}) for the details.
  _fzf_compgen_path() {
    fd --hidden --follow --exclude ".git" . "$1"
  }

  # Use fd to generate the list for directory completion
  _fzf_compgen_dir() {
    fd --type d --hidden --follow --exclude ".git" . "$1"
  }

fi

unset cfg_fzf_dir
