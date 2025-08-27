require File.join(File.dirname(__FILE__), "lib", "active_admin", "version")

Gem::Specification.new do |s|
  s.name          = 'activeadmin-rails'
  s.license       = 'MIT'
  s.version       = ActiveAdmin::VERSION
  s.homepage      = 'http://activeadmin.org'
  s.authors       = ['Piers Chambers, Greg Bell']
  s.email         = ['piers@varyonic.com']
  s.description   = 'A rapid development framework for Ruby on Rails.'
  s.summary       = 'A rapid development framework for Ruby on Rails.'

  s.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(spec|features)/})
  end

  s.test_files = `git ls-files -- {spec,features}/*`.split("\n")

  s.metadata = {
    "bug_tracker_uri" => "https://github.com/varyonic/activeadmin-rails/issues",
    "changelog_uri" => "https://github.com/varyonic/activeadmin-rails/blob/main/CHANGELOG.md",
    "source_code_uri" => "https://github.com/varyonic/activeadmin-rails",
  }

  s.required_ruby_version = '>= 2.5'

  s.add_dependency 'arbo'
  s.add_dependency 'csv'
  s.add_dependency 'formtastic'
  s.add_dependency 'formtastic_i18n'
  s.add_dependency 'inherited_resources', '>= 1.13.1'
  s.add_dependency 'jquery-rails', '>= 4.2.0'
  s.add_dependency 'jquery-ui-rails', '>= 6.0'
  s.add_dependency 'kaminari', '>= 1.0.1'
  s.add_dependency 'railties', '>= 5.0'
  s.add_dependency 'ransack', '>= 1.8.7'
  s.add_dependency 'dartsass-sprockets'
  s.add_dependency 'sprockets-es6', '>= 0.9.2'
end
