
if [ -e $HOME/.psql_history ]; then
    docker_run_options="$docker_run_options -v $HOME/.psql_history:$HOME/.psql_history"
fi


docker_run_options="$docker_run_options -e PAGER"

docker_run_options="$docker_run_options -e PGPASSWORD"
docker_run_options="$docker_run_options -e PGSSLMODE"

