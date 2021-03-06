lib = File.expand_path('../lib', __FILE__)
$:.unshift(lib) unless $:.include?(lib)
require 'nyancash/version'

Gem::Specification.new do |spec|
  spec.name          = 'nyancash'
  spec.version       = NyanCash::VERSION
  spec.authors       = ['Kasumi Hanazuki']
  spec.email         = ['kasumi@rollingapple.net']

  spec.summary       = %q{Ruby to GnuCash database binding}
  spec.description   = %q{Ruby to GnuCash database binding}
  spec.homepage      = 'https://github.com/hanazuki/nyancash'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split(?\0).reject {|f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) {|f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'sequel', '~> 4.25'

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.8'
end
