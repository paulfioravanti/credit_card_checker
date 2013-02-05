# Credit Card Checker

## Description

This is an attempt at a test-driven implementation of [Ruby Quiz #122: Checking Credit Cards](http://www.rubyquiz.com/quiz122.html)

All code is written in pure Ruby, with some help from [ActiveModel::Validations](http://api.rubyonrails.org/classes/ActiveModel/Validations.html) for model validation checks and [Thor](https://github.com/wycats/thor) for the command-line interface, and is tested using RSpec.

- Help with a Ruby-esque implementation of the [Luhn algorithm](http://en.wikipedia.org/wiki/Luhn_algorithm) came from [this StackOverflow answer](http://stackoverflow.com/a/9189731/567863)
- Test credit card numbers (valid and invalid) were generated using [this credit card number generator](http://www.mobilefish.com/services/credit_card_number_generator/credit_card_number_generator.php) by [MobileFish](http://www.mobilefish.com/)

If you find this repo useful, please help me level-up on [Coderwall](http://coderwall.com/) with an [![endorse](http://api.coderwall.com/pfioravanti/endorse.png)](http://coderwall.com/pfioravanti)

## Installation

Install

    $ bundle install

## Usage

Run program:

    $ bin/credit_card_checker

## Testing:

Code quality is attempted by using [RSpec](http://rspec.info/) for testing, [SimpleCov](https://github.com/colszowka/simplecov) for code test coverage, [Reek](https://github.com/troessner/reek) to fix code smells, and [Code Climate](https://codeclimate.com/) for quality metrics.

Run tests:

    $ rspec spec/

Check test coverage (after running rspec):

    $ open coverage/index.html

Check code smells:

    $ rake reek

Check quality metrics:

[![Code Climate](https://codeclimate.com/github/paulfioravanti/credit_card_checker.png)](https://codeclimate.com/github/paulfioravanti/credit_card_checker)

### TODOs:

- Fix that one last code reek...
- More robust CLI testing and implementation; make handling of bad files fail gracefully, add more options etc.

### Copyright

Copyright (c) 2012 Paul Fioravanti

See [LICENSE](https://github.com/paulfioravanti/credit_card_checker/blob/master/LICENSE.txt) for details.
