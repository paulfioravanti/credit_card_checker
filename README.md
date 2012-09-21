# Credit Card Checker

## Description

This is an attempt at a test-driven implementation of [Ruby Quiz #122: Checking Credit Cards](http://www.rubyquiz.com/quiz122.html)

All code is written in pure Ruby, with some help from [ActiveModel::Validations](http://api.rubyonrails.org/classes/ActiveModel/Validations.html) for model validation checks and Thor for the command-line interface, and is tested using RSpec.

- Help with a Ruby-esque implementation of the [Luhn algorithm](http://en.wikipedia.org/wiki/Luhn_algorithm) came from [this StackOverflow answer](http://stackoverflow.com/a/9189731/567863)
- Test credit card numbers (valid and invalid) were generated using [this credit card number generator](http://www.mobilefish.com/services/credit_card_number_generator/credit_card_number_generator.php) by [MobileFish](http://www.mobilefish.com/)

## Installation

Install

    $ bundle install

## Usage

Run program:

    $ bin/credit_card_checker

Run tests:

    $ rspec spec/

### TODOs:

- More robust CLI testing and implementation; make handling of bad files fail gracefully, add more options etc.
- Perhaps make use of factories

### Copyright

Copyright (c) 2012 Paul Fioravanti

See {file:LICENSE.txt} for details.
