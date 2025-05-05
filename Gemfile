source 'https://rubygems.org'

gem 'arbo'
gem 'jquery-ui-rails', '< 8.x' # Pending release of fixed version, see jquery/jquery-ui#2344

# Optional dependencies
gem 'cancan'
gem 'pundit'
gem 'jruby-openssl', '~> 0.10.1', platforms: :jruby

# Utility gems used in both development & test environments
gem 'rake'
gem 'parallel_tests'

# Debugging
gem 'pry' # Easily debug from your console with `binding.pry`

# Code style
gem 'rubocop', '0.51.0'
gem 'mdl', '0.4.0'

# Translations
gem 'i18n-tasks'

# Documentation
gem 'yard'                        # Documentation generator
gem 'kramdown'                    # Markdown implementation (for yard)
gem 'rexml'

group :development, :test do
  # Debugging
  gem 'better_errors' # Web UI to debug exceptions. Go to /__better_errors to access the latest one

  gem 'binding_of_caller', platforms: :mri # Retrieve the binding of a method's caller

  # Performance
  gem 'rack-mini-profiler' # Inline app profiler. See ?pp=help for options.
end

group :test do
  gem 'cuprite'
  gem 'capybara'
  gem 'simplecov', require: false # Test coverage generator. Go to /coverage/ after running tests
  gem 'codecov', require: false # Test coverage website. Go to https://codecov.io
  gem 'cucumber-rails', require: false
  gem 'cucumber'
  gem 'database_cleaner'
  gem 'jasmine'
  gem 'launchy'
  gem 'rspec-rails'
  gem 'i18n-spec'
end
