package Moose::Util::TypeConstraints::OptimizedConstraints;

use strict;
use warnings;

use Scalar::Util 'blessed', 'looks_like_number';

our $VERSION   = '0.01';
our $AUTHORITY = 'cpan:STEVAN';

sub Value { defined($_[0]) && !ref($_[0]) }

sub Ref { ref($_[0]) }

sub Str { defined($_[0]) && !ref($_[0]) }

sub Num { !ref($_[0]) && looks_like_number($_[0]) }

sub Int { defined($_[0]) && !ref($_[0]) && $_[0] =~ /^-?[0-9]+$/ }

{
    no warnings 'uninitialized';
    sub ScalarRef { ref($_[0]) eq 'SCALAR' }
    sub ArrayRef  { ref($_[0]) eq 'ARRAY'  }
    sub HashRef   { ref($_[0]) eq 'HASH'   }
    sub CodeRef   { ref($_[0]) eq 'CODE'   }
    sub RegexpRef { ref($_[0]) eq 'Regexp' }
    sub GlobRef   { ref($_[0]) eq 'GLOB'   }
}

sub FileHandle { ref($_[0]) eq 'GLOB' && Scalar::Util::openhandle($_[0]) }

sub Object { blessed($_[0]) && blessed($_[0]) ne 'Regexp' }

sub Role { blessed($_[0]) && $_[0]->can('does') }

# NOTE:
# we have XS versions too, ...
# 04:09 <@konobi> nothingmuch: konobi.co.uk/code/utilsxs.tar.gz
# 04:09 <@konobi> or utilxs.tar.gz iirc

1;

__END__

=pod

=head1 NAME

Moose::Util::TypeConstraints::OptimizedConstraints - Optimized constraint
bodies for various moose types

=head1 DESCRIPTION

This file contains the hand optimized versions of Moose type constraints.

=head1 FUNCTIONS

=over 4

=item Value

=item Ref

=item Str

=item Num

=item Int

=item ScalarRef

=item ArrayRef

=item HashRef

=item CodeRef

=item RegexpRef

=item GlobRef

=item FileHandle

=item Object

=item Role

=back

=head1 BUGS

All complex software has bugs lurking in it, and this module is no 
exception. If you find a bug please either email me, or add the bug
to cpan-RT.

=head1 AUTHOR

Yuval Kogman E<lt>nothingmuch@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2006-2008 by Infinity Interactive, Inc.

L<http://www.iinteractive.com>

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
