export_bw() {
  if bw login --check --raw 2>/dev/null ; then
    export BW_SESSION=$(bw unlock --raw)
  else
    export BW_SESSION=$(bw login --raw cypierre58@gmail.com)
  fi
}
