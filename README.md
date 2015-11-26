# Collection2csv

[![Build Status](https://travis-ci.org/ethirajsrinivasan/collection2csv.svg?branch=master)](https://travis-ci.org/ethirajsrinivasan/collection2csv)
[![Code Climate](https://codeclimate.com/github/ethirajsrinivasan/collection2csv/badges/gpa.svg)](https://codeclimate.com/github/ethirajsrinivasan/collection2csv)
[![security](https://hakiri.io/github/ethirajsrinivasan/collection2csv/master.svg)](https://hakiri.io/github/ethirajsrinivasan/collection2csv/master)

Collection2csv gem allows you to export a ActiveRecord collection of model objects to csv

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

Note: @collection is a ActiveRecord Collection


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ethirajsrinivasan/collection2csv.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

