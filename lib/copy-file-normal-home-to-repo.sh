set -Ceu

home_src="$1"
repo_dst="$2"

[ ! -e $home_src ] && exit

if [ ! -e $repo_dst ] || ! diff $home_src $repo_dst >/dev/null; then
    echo $home_src -\> $repo_dst
    mkdir -p $(dirname "$repo_dst")

    cp $home_src $repo_dst
fi

