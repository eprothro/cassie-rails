# How to Contribute

## Bugs

A pull request with a failing test is the best way to report an issue.

If you are unable to reproduce with a failing test, try again :). If you're still unable, open an issue.

To run the unit suite:
  * Fork the repo and then clone with `git clone https://github.com/YOUR-USERNAME/cassie-rails`
  * Install the bundle with `bundle`
  * Run `rake spec`

## Ideas

Feel more than free to open an issue for conversation about any ideas or suggestions.

## Making Changes

### Unit tests

Unit tests should provide complete coverage of features and should not depend on an available Cassandra server.


### Integration tests depending on database

Integration tests that rely on a Cassandra server exist as an extra 'sanity check' layer in `spec/integration/db`. Please don't create them as an excuse to not write solid unit tests.

Please do add them if they seem like a good idea! If you add one and it fails, please write a corresponding failing unit spec before fixing up.


## Working with Changes

### Running against local source

Load a console with `cassie-rails` source loaded to work with Cassie directly in development.

```
bin/console
```
```
irb(main):001:0> Cassie::Rails::VERSION
=> "1.0.1.30-dev"
```

### Installing your changes locally

Run `rake install` to:
* Run the test suite
* Build the gem
* Install into your local gemset

Or you may want to reference your changes from another project:
* Add `gem "cassie-rails", path: 'YOUR-SOURCE-DIRECTORY/cassie-rails'` to your other project's `Gemfile`
* Run `bundle`
* Execution will now use the source files in `YOUR-SOURCE-DIRECTORY/cassie-rails`
* Changes are included automatically (by definition)

### Releasing (maintainers only)

Run `rake release` to:
* Run the test suite
* Build the gem
* Publish the gem
* Bump the version (patch)

### Bumping the version

Bump version minor / major with `gem bump --version <minor|major>`.

Please don't include version bumps in your patches. Maintainers will handle this.
