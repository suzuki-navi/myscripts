set -Ceu

home_src="$1"
repo_dst="$2"

[ ! -e $home_src ] && exit

echo $home_src -\> $repo_dst
mkdir -p $(dirname "$repo_dst")

cp $home_src $repo_dst

