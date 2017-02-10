# Cassie Rails

`cassie-rails` provides Rails integration for [`cassie`](https://github.com/eprothro/cassie) application support. See the cassie readme for information on general usage.

### Installation

```ruby
# Gemfile
gem 'cassie-rails', '~> 1.0.0.alpha'
```
or
```bash
$ gem install cassie-rails --pre
```

### Casie Tasks

All `cassie` tasks are included in a Rails application with `cassie-rails`.

Prepend `cassie:` in front of the task to use them.

```
rake cassie:configuration:generate
```


Configure the cluster options for each application environment.

See the cassie readme for more information on [Configuration](https://github.com/eprothro/cassie#database-configuration) and [Connection Handling](https://github.com/eprothro/cassie#connection-handling).

See the cassie migrations readme for more information on [Migrations](https://github.com/eprothro/cassie#versioned-schema-migrations) and [Connection Handling](https://github.com/eprothro/cassie#connection-handling).


### Env Configuration

`cassie-rails` sets `Cassie::env` to the value in `Rails.env` upon Rails initialization.