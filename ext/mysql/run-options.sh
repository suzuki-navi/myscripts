
localhost_ip=$(ip -br -4 address | grep docker0 | awk '{print $3}' | sed -E -e 's/([0-9\.]+)\/.*/\1/g')

docker_run_options+=("--add-host=localhost:$localhost_ip")

