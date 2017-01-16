# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'flickrb_collage/version'

Gem::Specification.new do |spec|
  spec.name          = "flickrb_collage"
  spec.version       = FlickrbCollage::VERSION
  spec.authors       = ["Matheus Mina"]
  spec.email         = ["mfbmina@gmail.com"]

  spec.summary       = %q{Get 10 pics on Flickr and make a collage}
  spec.homepage      = "https://github.com/mfbmina/flickrb_collage"
  spec.license       = "MIT"
  spec.required_ruby_version = '>= 2.2.3'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'flickraw', '~> 0.9.9'
  spec.add_runtime_dependency 'mini_magick', '~> 4.6.0'

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
end
