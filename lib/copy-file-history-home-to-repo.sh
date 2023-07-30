set -Ceu

home_src="$1"
repo_dst="$2"

[ ! -e $home_src ] && exit

if [ ! -e $repo_dst ] || ! diff $home_src $repo_dst >/dev/null; then
    echo $home_src -\> $repo_dst
    mkdir -p $(dirname "$repo_dst")

    (
        if [ -e $repo_dst ]; then
            cat $repo_dst
            diff -u $repo_dst $home_src | grep -a -e '^+' | grep -a -v -e '^+++' | cut -b2-
        else
            cat $home_src
        fi
    ) >| $repo_dst.merged

    mv $repo_dst.merged $repo_dst
fi

