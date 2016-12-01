# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'supertitle/version'

Gem::Specification.new do |spec|
  spec.name          = "supertitle"
  spec.version       = Supertitle::VERSION
  spec.authors       = ["Justin Searls"]
  spec.email         = ["searls@gmail.com"]

  spec.summary       = %q{Converts between subtitles & transcripts}
  spec.description   = %q{Methods for converting between subtitles/captions/transcripts formats}
  spec.homepage      = "https://github.com/testdouble/supertitle"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "pry"
end
