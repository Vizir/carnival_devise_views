# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'carnival_devise_views/version'

Gem::Specification.new do |spec|
  spec.name          = "carnival_devise_views"
  spec.version       = CarnivalDeviseViews::VERSION
  spec.authors       = ["Vizir"]
  spec.email         = ["contato@vizir.com.br"]
  spec.summary       = %q{Generate Carnival Views File}
  spec.description   = %q{Generate Carnival Views File}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = Dir["{app,config,db,lib}/**/*", "Rakefile", "Gemfile", "LICENSE.txt", "README.md"]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
