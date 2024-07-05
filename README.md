[![Actions Status](https://github.com/localh0rst/API-Netbox-Perl/actions/workflows/test.yml/badge.svg)](https://github.com/localh0rst/API-Netbox-Perl/actions)
# NAME

API::Netbox - Wrapper for the Netbox API

# SYNOPSIS

    use API::Netbox;
    my $nb = API::Netbox->new(
      api_key => 'my_api_key',
      spec    => 'file:///path/to/netbox.json',
      # spec    => 'http://netbox.example.com/api/schema/',
      # URL is only required when using a different location than the default 
      url     => 'https://netbox.example.com/api/schema',
    );

# DESCRIPTION

API::Netbox is a small wrapper for the Netbox API.
Its using OpenAPI::Client to generate the API client.
There is no fance stuff, just a simple wrapper.

# LICENSE

Copyright (C) localh0rst.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

localh0rst <git@fail.ninja>
