# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/cachetool/version'

Gem::Specification.new do |spec|
  spec.name          = "capistrano-cachetool"
  spec.version       = Capistrano::Cachetool::VERSION
  spec.authors       = ["Tijs Verkoyen"]
  spec.email         = ["capistrano-cachetool@verkoyen.eu"]

  spec.summary       = %q{Cachetool support for Capistrano 3.x}
  spec.description   = %q{Exposes the [Cachetool by Goralina](http://gordalina.github.io/cachetool/) in Cpaistrano 3.x}
  spec.homepage      = "https://github.com/tijsverkoyen/capistrano-cachetool"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
