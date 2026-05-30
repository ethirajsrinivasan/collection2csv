# Changelog

All notable changes to this project will be documented in this file.

## [1.0.0] - 2026-05-30

### Breaking Changes

- Minimum Ruby version increased to 3.0
- Minimum Rails version increased to 6.0

### Added

- Explicit `railties` runtime dependency (>= 6.0, < 9.0)
- GitHub Actions CI with Ruby and Rails matrix
- RuboCop configuration and linting in CI
- bundler-audit security scanning in CI
- CHANGELOG and UPGRADE_GUIDE

### Changed

- Modernized gemspec and development dependencies
- Replaced Appraisal/Travis CI with GitHub Actions matrix
- Updated dummy app and specs for Rails 6+
- Updated README with Requirements section

### Removed

- Appraisal gemfiles for Rails 4.x and 5.0
- Travis CI configuration

## [0.1.5] - Previous Release

- ActiveRecord collection CSV export helper and controller

---

For upgrade instructions, see [UPGRADE_GUIDE.md](UPGRADE_GUIDE.md)
