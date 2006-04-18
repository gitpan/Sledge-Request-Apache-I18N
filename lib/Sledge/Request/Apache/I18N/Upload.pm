package Sledge::Request::Apache::I18N::Upload;
use strict;

use base qw(Class::Accessor);
__PACKAGE__->mk_accessors(qw(upload));

use vars qw($AUTOLOAD);

sub new {
    my $class = shift;
    my $r   = shift;
    bless { upload => $r->req->upload(@_) }, $class;
}

sub DESTROY { }

sub AUTOLOAD {
    my $self = shift;
    (my $meth = $AUTOLOAD) =~ s/.*:://;
    $self->upload->$meth(@_);
}


1;
