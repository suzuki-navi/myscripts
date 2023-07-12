set -Ceu

home_src="$1"
repo_dst="$2"

echo $home_src -\> $repo_dst
mkdir -p $(dirname "$repo_dst")

cat $repo_dst $home_src | perl -e '
    my @arr = ();
    while (my $line = <STDIN>) {
        unless (grep {$_ eq $line} @arr) {
            print $line;
            push(@arr, $line);
        }
    }
' >| $repo_dst.merged

mv $repo_dst.merged $repo_dst
