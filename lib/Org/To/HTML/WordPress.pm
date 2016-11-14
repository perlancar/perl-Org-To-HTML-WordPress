package Org::To::HTML::WordPress;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

use Moo;
extends 'Org::To::HTML';

use Exporter qw(import);
our @EXPORT_OK = qw(org_to_html_wordpress);

our %SPEC;

$SPEC{org_to_html_wordpress} = $Org::To::HTML::SPEC{org_to_html};
sub org_to_html_wordpress {
    Org::To::HTML::org_to_html(@_, _class => __PACKAGE__);
}

sub export_block {
    my $self = shift;
    my ($elem) = @_;

    if ($elem->name eq 'SRC') {
        join "", (
            "[sourcecode language=\"".($elem->args->[0] || "none")."\"]\n",
            $elem->raw_content,
            "[/sourcecode]\n",
        );
    } else {
        $self->SUPER::export_block(@_);
    }
}

1;
# ABSTRACT: Export Org document to HTML (WordPress variant)

=for Pod::Coverage ^(export_.+)$

=head1 SYNOPSIS

 use Org::To::HTML::WordPress qw(org_to_html_wordpress);

 # use like you would use Org::To::HTML's org_to_html()


=head1 DESCRIPTION

This is a subclass of L<Org::To::HTML> that produces WordPress-variant of HTML.
Currently the differences are:

=over

=item * SRC Block

Instead of:

 <PRE CLASS="block block_src"> ... </PRE>

will instead use:

 [sourcecode language="..."]
 ...
 [/sourcecode]

=back


=head1 SEE ALSO

L<Org::To::HTML>

=cut
