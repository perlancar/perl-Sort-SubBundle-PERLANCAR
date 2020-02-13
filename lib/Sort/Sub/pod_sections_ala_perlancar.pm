package Sort::Sub::pod_sections_ala_perlancar;

# AUTHORITY
# DATE
# DIST
# VERSION

use 5.010001;
use strict;
use warnings;

our $SORT_SPEC = [
    # preamble
    'NAME',
    'SPECIFICATION VERSION',
    'VERSION',
    'DEPRECATION NOTICE',
    'SYNOPSIS',

    # main content
    'DESCRIPTION',

    # Bencher::Scenario::*
    'BENCHMARKED MODULES',
    'BENCHMARK PARTICIPANTS',
    'BENCHMARK DATASETS',
    'SAMPLE BENCHMARK RESULTS',

    # everything else that are uncategorized go here
    sub { 1 },

    # reference section
    'FUNCTIONS',
    'ATTRIBUTES',
    'METHODS',

    # reference section (CLI)
    'SUBCOMMANDS',
    'OPTIONS',

    # other content (CLI)
    'COMPLETION',

    # FAQ (after all content & references)
    'FAQ',
    'FAQS',

    # links/pointers (CLI)
    'CONFIGURATION FILE',
    'CONFIGURATION FILES',
    'ENVIRONMENT',
    'ENVIRONMENT VARIABLES',
    'FILES',

    # todos
    'TODO',
    'TODOS',

    # links/pointers/extra information
    'HISTORY',
    'HOMEPAGE',
    'SOURCE',
    qr/^.+'S BUGS$/i, # in a forked module, i put the original module's BUGS in ORIGMODULE'S BUGS
    'BUGS',
    'SEE ALSO',

    # author & copyright
    qr/^.+'S AUTHORS?$/i, # in a forked module, i put the original module's AUTHOR in ORIGMODULE'S AUTHOR
    qr/^AUTHORS?/,
    qr/^.+'S COPYRIGHT( AND LICENSE)?$/i, # in a forked module, i put the original module's COPYRIGHT in ORIGMODULE'S COPYRIGHT
    'COPYRIGHT AND LICENSE',
    'COPYRIGHT',
];

sub meta {
    return {
        v => 1,
        summary => 'Sort POD sections (headings) PERLANCAR-style',
    };
}

sub gen_sorter {
    require Sort::BySpec;

    my ($is_reverse, $is_ci) = @_;

    Sort::BySpec::cmp_by_spec(
        spec => $SORT_SPEC,
        reverse => $is_reverse,
    );
}

1;
# ABSTRACT:

=for Pod::Coverage ^(gen_sorter|meta)$

=head1 DESCRIPTION

POD sections in a Perl documentation are usually ordered according to a certain
convention, e.g.:

 NAME
 VERSION
 SYNOPSIS
 DESCRIPTION
 ...

I include this convention plus some more for my specific POD sections.


=head1 prepend:SEE ALSO

L<Pod::Weaver::Plugin::PERLANCAR::SortSections>, which uses the sort
specification in this module, to actually sort POD sections in POD documents
during dzil build.
