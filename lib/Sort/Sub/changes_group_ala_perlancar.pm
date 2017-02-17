package Sort::Sub::changes_group_ala_perlancar;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

sub gen_sorter {
    require Sort::BySpec;

    my ($is_reverse, $is_ci) = @_;

    Sort::BySpec::cmp_by_spec(
        spec => [
            '',
            qr/incompatible/i,
            qr/remove|delete/i,
            qr/new|feature/i,
            qr/enhance/i,
            qr/bug|fix/i,
        ],
        reverse => $is_reverse,
    );
}

1;
# ABSTRACT: Sort changes group heading PERLANCAR-style

=for Pod::Coverage ^(gen_sorter)$

=head1 DESCRIPTION

A Changes file can group its changes entries into groups with headings, e.g.:

 [ENHANCEMENTS]

 - blah blah

 - blah

 [BUG FIXES]

 - blah blah blah

I sort these group headings according to this principle: put the items that are
more important that people would want to read first. The groups are thus sorted
in this order:

 Incompatible changes
 Removed features
 New features
 Enhancements
 Bug fixes
