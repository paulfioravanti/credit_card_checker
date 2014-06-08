require 'coveralls'
Coveralls.wear!

require 'simplecov'
SimpleCov.start

require 'rspec'
require 'rspec/its' # redo tests so this doesn't need to get used
require 'support/utilities'

include CreditCardChecker