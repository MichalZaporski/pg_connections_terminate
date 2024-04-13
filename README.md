# PgConnectionsTerminate

This gem adds a new rake task which terminates all the connections with the Rails app database.
Database is selected based on the `config/database.yml` and the `RAILS_ENV`.

## Installation

Install the gem and add to the application's Gemfile by executing:

```sh
$ bundle add pg_connections_terminate
```

## Usage

Run like any other Rails rake task:

```sh
$ bundle exec bin/rails db:connections:terminate RAILS_ENV=test
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/MichalZaporski/pg_connections_terminate.
