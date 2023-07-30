set -Ceu

repo_src="$1"
home_dst="$2"

if [ ! -e $home_dst ] || ! diff $repo_src $home_dst >/dev/null; then
    echo $repo_src -\> $home_dst
    mkdir -p $(dirname "$home_dst")

    cat $repo_src $home_dst | perl -e '
        my @arr = ();
        while (my $line = <STDIN>) {
            unless (grep {$_ eq $line} @arr) {
                print $line;
                push(@arr, $line);
            }
        }
    ' >| $home_dst.merged

    mv $home_dst.merged $home_dst
fi
