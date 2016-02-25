package Sort::Sub::perlancar_prereq_sort;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

sub gen_sorter {
    my ($is_reverse, $is_ci) = @_;

    sub {
        no strict 'refs';

        my $caller = caller();
        my $a = ${"$caller\::a"};
        my $b = ${"$caller\::b"};

        my $cmp = 0;
        {
            my $a_is_perl = $a eq 'perl' ? 1:0;
            my $b_is_perl = $b eq 'perl' ? 1:0;

            my $a_is_pragma = $a =~ /\A[a-z]/ ? 1:0;
            my $b_is_pragma = $b =~ /\A[a-z]/ ? 1:0;

            $cmp =
                ($b_is_perl <=> $a_is_perl) ||
                ($b_is_pragma <=> $a_is_pragma) ||
                lc($a) cmp lc($b);
        }

        $is_reverse ? -1*$cmp : $cmp;
    };
}

1;
# ABSTRACT: Sort prereqs PERLANCAR-style

=for Pod::Coverage ^(gen_sorter)$

=head1 DESCRIPTION

I sort my prereqs in F<dist.ini> using this rule: C<perl>, then pragmas (sorted
ascibetically), then other modules (sorted ascibetically and
case-insensitively).

Case-sensitive option is ignored. Sorting is always done using the
abovementioned rule.


=head1 SEE ALSO
