# Collection2csv

[![CI](https://github.com/ethirajsrinivasan/collection2csv/actions/workflows/ci.yml/badge.svg)](https://github.com/ethirajsrinivasan/collection2csv/actions/workflows/ci.yml)
[![Gem Version](https://badge.fury.io/rb/collection2csv.svg)](https://badge.fury.io/rb/collection2csv)

Export ActiveRecord collections to CSV via a Rails helper and download endpoint.

## Requirements

- Ruby >= 3.0
- Rails >= 6.0

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'collection2csv'
```

And then execute:

```bash
bundle install
```

Or install it yourself as:

```bash
gem install collection2csv
```

## Usage

Use the `collection_download` helper:

```erb
<%= collection_download(@users) %>
```

Select specific columns:

```erb
<%= collection_download(@users, columns: ['id', 'name']) %>
```

Custom link text:

```erb
<%= collection_download(@users, link_text: 'Download CSV') %>
```

Include associations:

```erb
<%= collection_download(@users, associations: { book: ['id', 'name'] }) %>
```

## Upgrading from 0.x to 1.0

Version 1.0.0 requires Ruby 3.0+ and Rails 6.0+. See [UPGRADE_GUIDE.md](UPGRADE_GUIDE.md).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ethirajsrinivasan/collection2csv. Contributors are expected to adhere to the [Contributor Covenant](CODE_OF_CONDUCT.md) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](LICENSE.txt).
