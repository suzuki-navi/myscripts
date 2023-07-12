set -Ceu

repo_src="$1"
home_dst="$2"

[ ! -e $repo_src ] && exit

echo $repo_src -\> $home_dst
mkdir -p $(dirname "$home_dst")

(
    cat $repo_src
    if [ -e $home_dst ]; then
      diff -u $repo_src $home_dst | grep -a -e '^+' | grep -a -v -e '^+++' | cut -b2-
    fi
) >| $home_dst.merged

mv $home_dst.merged $home_dst

