if [ -e $HOME/.emacs ]; then
  docker_run_options+=("-v")
  docker_run_options+=("$HOME/.emacs:$HOME/.emacs")

fi
if [ -e $HOME/.emacs.d ]; then
  docker_run_options+=("-v")
  docker_run_options+=("$HOME/.emacs.d:$HOME/.emacs.d")
fi
