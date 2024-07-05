requires 'perl', '5.008001';
requires 'Moo';
requires 'OpenAPI::Client';

on 'test' => sub {
    requires 'Test::More', '0.98';
};

