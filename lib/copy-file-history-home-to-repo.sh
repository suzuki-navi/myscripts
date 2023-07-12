set -Ceu

home_src="$1"
repo_dst="$2"

[ ! -e $home_src ] && exit
[ ! -e $repo_dst ] && exit

echo $home_src -\> $repo_dst
mkdir -p $(dirname "$repo_dst")

(
    cat $repo_dst
    diff -u $repo_dst $home_src | grep -a -e '^+' | grep -a -v -e '^+++' | cut -b2-
) >| $repo_dst.merged

mv $repo_dst.merged $repo_dst

