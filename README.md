# Cassie Rails

`cassie-rails` provides Rails integration for [`cassie`](https://github.com/eprothro/cassie) application support.

See the Cassie [README](https://github.com/eprothro/cassie) for information on usage. Only Rails-specific tweaks are included here.

### Installation

```ruby
# Gemfile
gem 'cassie-rails', '~> 1.0.0'
```
or
```bash
$ gem install cassie-rails
```

### Casie Tasks

The `cassie` binary is shimmed in a Rails application with `cassie-rails`.

This shim loads and initializes the Rails enviroment.  This ensures, among other things, that any Cassie configuration set up during applicatIon initialization is applied when executing `cassie` commands.

```
cassie-rails --help
```

```
Usage:
  cassie-rails <command> [options]

Commands:
  configuration:generate    # Generate a sample cassandra configuration file
  migrate                   # alias for schema:migrate
  migrate:reset             # Drop and reload the schema, then migrate
  migration:create          # Generates an empty migration file prefixed with the next semantic version number
  migrations:import         # Imports existing `cassandra_migrations` migration files and converts to semantic versioning
  restart                   # Stop and restart the cassandra server process
  schema:drop               # drop default keyspace and schema versioning keyspace
  schema:dump               # Dumps the schema for all non-system keyspaces in CQL format (`db/cassandra/schema.cql` by default)
  schema:history            # Print the history of applied schema migrations
  schema:import             # Create an initial schema version based on the current schema
  schema:init               # Initialize versioning schema and the keyspace for this environment
  schema:init_keyspace      # Initialize the keyspace for the current environment
  schema:init_versioning    # Initialize cassie schema versioning
  schema:load               # Creates the schema by executing the CQL in the schema file (`db/cassandra/schema.cql` by default)
  schema:migrate            # Migrates the schema by running the `up` methods for any migrations starting after the current schema version
  schema:reset              # Creates the schema by executing the CQL in the schema file (`db/cassandra/schema.cql` by default)
  schema:status             # Prints the migration status of all schema migrations, local and applied
  schema:version            # Print the history of applied schema migrations
  start                     # Start the cassandra server process in the background with reduced verbosity
  stop                      # Stop the cassandra server process
  tail                      # Tail the cassandra server logs

Options:
  -h, --help                # Print this documentation
  -v, --version             # List the library version
  <command> --help          # List options for a given command
```

```
cassie-rails configuration:generate
```

```
-- Generating sample cassie cluster configuration file
   > created /Users/eprothro/source/my-rails-app/config/cassandra.yml
-- done
```

### Cassie Configuration

* `Cassie.env` is set to the value in `Rails.env` upon Rails initialization.