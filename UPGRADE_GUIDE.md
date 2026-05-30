# Upgrade Guide: Collection2csv 0.x to 1.0

## Overview

Collection2csv 1.0 modernizes the gem for current Ruby and Rails versions.

## What Changed

| Component | Old Version | New Version |
|-----------|-------------|-------------|
| Ruby | >= 2.0.0 | >= 3.0 |
| Rails | >= 4.0 (via Appraisal) | >= 6.0 |

## Upgrade Steps

1. Ensure your application runs Ruby 3.0+ and Rails 6.0+
2. Update your Gemfile: `gem 'collection2csv', '~> 1.0'`
3. Run `bundle update collection2csv`
4. Verify CSV export links and downloads still work

## Getting Help

- [GitHub Issues](https://github.com/ethirajsrinivasan/collection2csv/issues)
- [CHANGELOG.md](CHANGELOG.md)
