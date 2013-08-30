# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'batman-rails/version'

Gem::Specification.new do |gem|
  gem.name          = "batman-rails"
  gem.version       = Batman::Rails::VERSION
  gem.authors       = ["Nick Small", "Matt Helm", "John Duff", "Kristian PD"]
  gem.email         = ["batmanjs@shopify.com"]
  gem.description   = %q{Quickly get started with batman.js in a Rails app. Provides generators to get started and bundles in the latest version of batman.js.}
  gem.summary       = %q{Use batman.js with Rails}
  gem.homepage      = "https://github.com/Shopify/batman-rails"
  gem.date          = File.utime('VERSION')

  gem.add_dependency "railties", [">= 3.2"]

  gem.add_development_dependency "bundler"
  gem.add_development_dependency "rails"
  gem.add_development_dependency "mocha"
  gem.add_development_dependency "sqlite3"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
