package API::Netbox;
use 5.008001;
use strict;
use warnings;
use Moo;
our $VERSION = "0.01";

has 'token'  => ( is => 'rw', required => 1 );
has 'spec'   => ( is => 'rw', required => 1 );
has 'url'    => ( is => 'rw', required => 0 );
has 'client' => ( is => 'rw', required => 0 );

sub BUILD {
  my $self = shift;

  $self->client( OpenAPI::Client->new( $self->spec, ( $self->url ? ( base_url => $self->url ) : () ) ) );

  $self->c->ua->max_redirects(5);

  $self->c->ua->on(
    start => sub {
      my ( $ua, $tx ) = @_;
      $tx->req->headers->header( 'Authorization' => 'Token ' . $self->token );
    }
  );

}

1;
__END__

=encoding utf-8

=head1 NAME

API::Netbox - Wrapper for the Netbox API

=head1 SYNOPSIS

    use API::Netbox;
    my $nb = API::Netbox->new(
      api_key => 'my_api_key',
      spec    => 'file:///path/to/netbox.json',
      # spec    => 'http://netbox.example.com/api/schema/',
      # URL is only required when using a different location than the default 
      url     => 'https://netbox.example.com/api/schema',
    );

=head1 DESCRIPTION

API::Netbox is a small wrapper for the Netbox API.
Its using OpenAPI::Client to generate the API client.
There is no fance stuff, just a simple wrapper.

=head1 LICENSE

Copyright (C) localh0rst.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

localh0rst E<lt>git@fail.ninjaE<gt>

=cut
