
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "activeadmin/core/version"

Gem::Specification.new do |spec|
  spec.name          = "activeadmin-core"
  spec.version       = Activeadmin::Core::VERSION
  spec.authors       = ["Piers Chambers"]
  spec.email         = ["piers@varyonic.com"]

  spec.summary       = 'The administration framework for Ruby on Rails.'
  spec.homepage      = 'http://activeadmin.info'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.test_files = `git ls-files -- {spec,features}/*`.split("\n")

  spec.required_ruby_version = '>= 2.2'

  spec.add_dependency 'arbre', '>= 1.1.1'
  spec.add_dependency 'formtastic', '~> 3.1'
  spec.add_dependency 'formtastic_i18n'
  spec.add_dependency 'inherited_resources', '>= 1.7.0'
  spec.add_dependency 'jquery-rails', '>= 4.2.0'
  spec.add_dependency 'kaminari', '>= 1.0.1'
  spec.add_dependency 'railties', '>= 4.2', '< 5.3'
  spec.add_dependency 'ransack', '>= 1.8.7'
  spec.add_dependency 'sass', '~> 3.4'
  spec.add_dependency 'sprockets', '>= 3.0', '< 4.1'
  spec.add_dependency 'sprockets-es6', '>= 0.9.2'

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
