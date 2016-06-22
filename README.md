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

  	<%= collection_download(@activerecord_collection) %>

In order to select a particular columns use column names as follows

    <%= collection_download(@activerecord_collection, {columns: ['id','name']}) %>

Download link text can be provided as follows

    <%= collection_download(@activerecord_collection, {link_text: 'export'}) %>

Supports Associations

    <%= collection_download(@activerecord_collection, {columns: ['id','name'], associations: {association_name: ['id','name']}}) %>

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ethirajsrinivasan/collection2csv.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## TODO

Specs to be written
