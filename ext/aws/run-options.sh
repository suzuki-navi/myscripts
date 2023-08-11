if [ -e $HOME/.aws ]; then
    docker_run_options+=("-v")
    docker_run_options+=("$HOME/.aws:$HOME/.aws")
fi
