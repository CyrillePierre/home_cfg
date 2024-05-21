update_venv() {
  venv_dirname='.venv'

  # automatically deactivate when leaving a (sub-)directory containing a virtual env
  # echo "pwd:  ${PWD:P}"
  # echo "venv: ${VIRTUAL_ENV:P:h}"
  if [[ -v ${VIRTUAL_ENV} && ! ${PWD:P}/ = ${VIRTUAL_ENV:P:h}/* ]] ; then
    echo "deactivate"
    deactivate
  fi

  if [[ -d "${venv_dirname}" ]] ; then
    echo "activate venv: ${PWD}/${venv_dirname}"
    source "${venv_dirname}/bin/activate"
  fi
}

autoload -U add-zsh-hook
add-zsh-hook chpwd update_venv
