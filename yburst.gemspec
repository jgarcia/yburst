# -*- encoding: utf-8 -*-
require File.expand_path('../lib/yburst/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Joel Garcia Martinez"]
  gem.email         = ["joelgarciamartinez@gmail.com"]
  gem.description   = %q{A wapper for the Burst SMS api}
  gem.summary       = %q{Provides a simple wrapper api around Burst Sms' http api}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "yburst"
  gem.require_paths = ["lib"]
  gem.version       = Yburst::VERSION

  gem.add_dependency "httparty"

  gem.add_development_dependency "rspec"
end
