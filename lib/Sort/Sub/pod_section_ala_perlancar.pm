package Sort::Sub::pod_section_ala_perlancar;

use 5.010001;
use strict;
use warnings;

# AUTHORITY
# DATE
# DIST
# VERSION

our $SORT_SPEC = [
    # ORIGINAL XXX are for forked modules, where the ORIGINAL XXX sections are
    # the sections from the original (forked) module, and the XXX sections are
    # for the new module (the fork).


    # preamble
    'NAME',
    'SPECIFICATION VERSION',
    'VERSION',
    'DEPRECATION NOTICE',
    'SAH SCHEMAS', 'SAH SCHEMA DEFINITION', # Sah::Schema::*, Sah::Schemas::*
    'SYNOPSIS', 'ORIGINAL SYNOPSIS',


    # main content
    'DESCRIPTION', 'ORIGINAL DESCRIPTION',


    # Acme::CPANModules::*
    "ACME::CPANMODULES ENTRIES",
    "ACME::CPANMODULES FEATURE COMPARISON MATRIX",


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


    # from bsd
    'IMPLEMENTATION NOTES',


    # other content (CLI)
    'COMPLETION',


    # FAQ (after all content & references)
    'FAQ', 'ORIGINAL FAQ',
    'FAQS', 'ORIGINAL FAQS',


    # links/pointers (CLI)
    'CONFIGURATION FILE',
    'CONFIGURATION FILES',
    'ENVIRONMENT',
    'ENVIRONMENT VARIABLES',
    'FILES',


    # exit status, diagnostics, errors. from bsd
    'EXIT STATUS',
    'DIAGNOSTICS',
    # RETURN VALUE # for syscall
    # ERRORS # for syscall


    # examples, from bsd
    'EXAMPLES',


    # todos
    'TODO', 'ORIGINAL TODO',
    'TODOS', 'ORIGINAL TODOS',


    # links
    'HOMEPAGE', 'ORIGINAL HOMEPAGE',
    'SOURCE', 'ORIGINAL SOURCE',
    'SEE ALSO', 'ORIGINAL SEE ALSO',


    # standards, from bsd
    'STANDARDS',


    # history
    'HISTORY', 'ORIGINAL HISTORY',


    # credits, authors, contributors, & copyright
    'CREDITS', 'ORIGINAL CREDITS',
    'THANKS', 'ORIGINAL THANKS',

    qr/^AUTHORS?/,
    qr/^ORIGINAL AUTHORS?/,

    'CONTRIBUTOR', 'CONTRIBUTORS',

    'CONTRIBUTING',

    'COPYRIGHT AND LICENSE', 'ORIGINAL COPYRIGHT AND LICENSE',
    'COPYRIGHT & LICENSE', 'ORIGINAL COPYRIGHT & LICENSE',
    'COPYRIGHT', 'ORIGINAL COPYRIGHT',
    'LICENSE', 'ORIGINAL LICENSE',


    # bugs/caveats
    'BUGS', 'ORIGINAL BUGS',
    'GOTCHAS',
    'CAVEATS',
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
