# RepoSmallBadge

[![Gem Version](https://badge.fury.io/rb/repo-small-badge.svg)](https://badge.fury.io/rb/repo-small-badge)
[![Build Status](https://api.travis-ci.org/MarcGrimme/repo-small-badge.svg?branch=master)](https://secure.travis-ci.org/MarcGrimme/repo-small-badge)
[![Depfu](https://badges.depfu.com/badges/e794da00404482f66ce7ca05eea9640b/count.svg)](https://depfu.com/github/MarcGrimme/repo-small-badge?project_id=6915)
[![Coverage](https://marcgrimme.github.io/repo-small-badge/badges/coverage_badge_total.svg)](https://marcgrimme.github.io/repo-small-badge/coverage/index.html)
[![RubyCritic](https://marcgrimme.github.io/repo-small-badge/badges/rubycritic_badge_score.svg)](https://marcgrimme.github.io/repo-small-badge/tmp/rubycritic/overview.html)

*RepoSmalladge* is a gem that can be added to the `Gemfile` and consolidates functionality to produce a badge file.
The text place and other configurable can be specified at instance time.

## Installation

The badge creation is dependent on the [Victor gem](https://github.com/DannyBen/victor) for creating the SVG formatted badge.

It can be installed in your Ruby library or rails app as part of the `Gemfile` as follows.

```
# In your gemfile
gem 'repo-small-badge', :require => false
```

## Usage

Most propably you need a surrounding formatter for a different badge you want to create and this gem is implicitly required.

Examples are:
* [SimpleCovSmallBadge](https://github.com/MarcGrimme/simplecov-small-badge)

## Configuration Options

The behaviour of `RepoSmallBadge` can be influenced by configuration options that are passed to the constructor as a hash.
The following options are supported:

## Development

After checking out the repo, run `bundle update` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/marcgrimme/repo-small-badge/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
