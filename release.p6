use JSON::Fast;

sub MAIN() {
    given from-json(slurp('META6.json')) -> (:$name!, :$version!, *%) {
        my $dist-name = $name.subst('::', '-', :g);
        my $tar-name = "{$dist-name}-{$version}.tar.gz";
        write-tar($dist-name, $tar-name);
        tag("release-$version");
    }
}

sub write-tar($dist-name, $tar-name) {
    shell "git archive --prefix=$dist-name/ -o ../$tar-name HEAD"
}

sub tag($tag) {
    shell "git tag -a -m '$tag' $tag && git push --tags origin"
}
