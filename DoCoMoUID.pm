package Apache::DoCoMoUID;

use strict;
use Apache::Constants qw(:common);
use Apache::Request;

use vars qw($VERSION);
$VERSION = '0.01';

sub handler {
    my $r = Apache::Request->instance(shift);
    if ($r->header_in('User-Agent') =~ /DoCoMo/) {
        $r->header_in('X-DoCoMo-UID' => $r->param('uid'))
    }
    return OK;
}

1;
__END__

=head1 NAME

Apache::DoCoMoUID - Add i-mode terminal's uid to HTTP Request Header

=head1 SYNOPSIS

  # in httpd.conf
  PerlInitHandler Apache::DoCoMoUID

=head1 DESCRIPTION

Apache::DoCoMoUID sets the value of uid to HTTP Request Header
as X-DoCoMo-UID.  Thereby, that value can be referred to now
from an environment variable ($ENV{HTTP_X_DOCOMO_UID) in your program.

Moreover, that value is also recordable on the access_log of Apache.
It is, even when requested by POST, of course.  If the following setup
is in httpd.conf, uid of all cellular phones (i/v/ez) can be recorded now.

  # in httpd.conf
  LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\" %{x-docomo-uid}i %{x-jphone-uid}i %{x-up-subno}i" mobile_combined
  CustomLog /usr/local/apache/logs/access_log mobile_combined

=head1 CAUTION

Apache::Request object twice within the same request -
the symptoms being that the second Apache::Request
object will not contain the form parameters because
they have already been read and parsed.
Since -- Phase after this It is necessary to use Apache::Request->instance().

=head1 AUTHOR

Satoshi Tanimoto E<lt>tanimoto@cpan.orgE<gt>

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

L<Apache>, L<Apache::Request>

=cut
