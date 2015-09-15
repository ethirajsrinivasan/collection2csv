# Collection2csv

Collection2csv gem allows you to export a collection of model objects to csv

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'collection2csv'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install collection2csv

## Usage

Use the collection_download helper like any other regular tag helper :

<%= collection_download(@collection) %>

In order to select a particular columns use column names as follows

<%= collection_download(@collection,'column_name1,column_name2') %>


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake false` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ethirajsrinivasan/collection2csv. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

