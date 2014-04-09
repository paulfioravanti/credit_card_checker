require File.expand_path('../lib/credit_card_checker/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "credit_card_checker"
  gem.version       = CreditCardChecker::VERSION
  gem.summary       = %q{Ruby Quiz #122: Checking Credit Cards}
  gem.description   = %q{Ruby Quiz #122: Checking Credit Cards}
  gem.license       = "MIT"
  gem.authors       = ["Paul Fioravanti"]
  gem.email         = "paul.fioravanti@gmail.com"
  gem.homepage      = "https://rubygems.org/gems/credit_card_checker"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_development_dependency 'bundler', '~> 1.6.1'
  gem.add_development_dependency 'rake', '~> 10.0'
  gem.add_development_dependency 'rspec', '~> 2.14'
  gem.add_development_dependency 'rubygems-tasks', '~> 0.2'
  gem.add_development_dependency 'yard', '~> 0.8'
  gem.add_development_dependency 'thor', '~> 0.17'
  gem.add_development_dependency 'activemodel', '~> 4.0'
end
