set -Ceu

repo_src="$1"
home_dst="$2"

[ ! -e $repo_src ] && exit

echo $repo_src -\> $home_dst
mkdir -p $(dirname "$home_dst")

cp $repo_src $home_dst

