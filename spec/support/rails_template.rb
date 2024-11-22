# Rails template to build the sample app for specs

copy_file File.expand_path('../templates/manifest.js', __FILE__), 'app/assets/config/manifest.js', force: true

create_file 'app/assets/stylesheets/some-random-css.css'
create_file 'app/assets/javascripts/some-random-js.js'
create_file 'app/assets/images/a/favicon.ico'

generate :model, 'post title:string body:text published_date:date author_id:integer ' +
  'position:integer custom_category_id:integer starred:boolean foo_id:integer'

create_file 'app/models/post.rb', <<-RUBY.strip_heredoc, force: true
  class Post < ActiveRecord::Base
    belongs_to :category, foreign_key: :custom_category_id, optional: true
    belongs_to :author, class_name: 'User', optional: true
    has_many :taggings
    accepts_nested_attributes_for :author
    accepts_nested_attributes_for :taggings, allow_destroy: true

    ransacker :custom_title_searcher do |parent|
      parent.table[:title]
    end

    ransacker :custom_created_at_searcher do |parent|
      parent.table[:created_at]
    end

    ransacker :custom_searcher_numeric, type: :numeric do
      # nothing to see here
    end

    def self.ransackable_attributes(auth_object = nil)
      ["author_id", "body", "created_at", "custom_category_id",
       "custom_created_at_searcher", "custom_searcher_numeric",
       "custom_title_searcher", "foo_id", "id", "position",
       "published_date", "starred", "title", "updated_at"]
    end

    def self.ransackable_associations(auth_object = nil)
      ["author", "category", "taggings", "kategory"]
    end
  end
RUBY
copy_file File.expand_path('../templates/post_decorator.rb', __FILE__), 'app/models/post_decorator.rb'

generate :model, 'blog/post title:string body:text published_date:date author_id:integer ' +
  'position:integer custom_category_id:integer starred:boolean foo_id:integer'
create_file 'app/models/blog/post.rb', <<-RUBY.strip_heredoc, force: true
  class Blog::Post < ActiveRecord::Base
    belongs_to :category, foreign_key: :custom_category_id
    belongs_to :author, class_name: 'User'
    has_many :taggings
    accepts_nested_attributes_for :author
    accepts_nested_attributes_for :taggings, allow_destroy: true

    def self.ransackable_attributes(auth_object = nil)
      ["author_id", "body", "created_at",
       "custom_category_id", "foo_id", "id",
       "position", "published_date", "starred", "title", "updated_at"]
    end

    def self.ransackable_associations(auth_object = nil)
      ["author", "category", "taggings"]
    end
  end
RUBY

generate :model, 'profile user_id:integer bio:text'

generate :model, 'user type:string first_name:string last_name:string username:string age:integer encrypted_password:string'
create_file 'app/models/user.rb', <<-RUBY.strip_heredoc, force: true
  class User < ActiveRecord::Base
    class VIP < self
    end
    has_many :posts, foreign_key: 'author_id'
    has_one :profile
    accepts_nested_attributes_for :profile, allow_destroy: true
    accepts_nested_attributes_for :posts, allow_destroy: true

    ransacker :age_in_five_years, type: :numeric, formatter: proc { |v| v.to_i - 5 } do |parent|
      parent.table[:age]
    end

    def self.ransackable_attributes(auth_object = nil)
      ["age", "age_in_five_years", "created_at",
       "first_name", "id", "last_name", "type", "updated_at", "username"]
    end

    def self.ransackable_associations(auth_object = nil)
      ["posts", "profile"]
    end

    def display_name
      "\#{first_name} \#{last_name}"
    end
  end
RUBY

create_file 'app/models/profile.rb', <<-RUBY.strip_heredoc, force: true
  class Profile < ActiveRecord::Base
    belongs_to :user

    def self.ransackable_attributes(auth_object = nil)
      ["bio", "created_at", "id", "updated_at", "user_id"]
    end
  end
RUBY

generate :model, 'publisher --migration=false --parent=User'

generate :model, 'category name:string description:text'
create_file 'app/models/category.rb', <<-RUBY.strip_heredoc, force: true
  class Category < ActiveRecord::Base
    has_many :posts, foreign_key: :custom_category_id
    has_many :authors, through: :posts
    accepts_nested_attributes_for :posts

    def self.ransackable_attributes(auth_object = nil)
      ["created_at", "description", "id", "name", "updated_at"]
    end

    def self.ransackable_associations(auth_object = nil)
      ["authors", "posts"]
    end
  end
RUBY

generate :model, 'store name:string user_id:integer'
create_file 'app/models/store.rb', <<-RUBY.strip_heredoc, force: true
  class Store < ActiveRecord::Base
    def self.ransackable_attributes(auth_object = nil)
      ["created_at", "id", "name", "updated_at", "user_id"]
    end
  end
RUBY

generate :model, 'tag name:string'
create_file 'app/models/tag.rb', <<-RUBY.strip_heredoc, force: true
  class Tag < ActiveRecord::Base
  end
RUBY

generate :model, 'tagging post_id:integer tag_id:integer position:integer'
create_file 'app/models/tagging.rb', <<-RUBY.strip_heredoc, force: true
  class Tagging < ActiveRecord::Base
    belongs_to :post, optional: true
    belongs_to :tag, optional: true

    delegate :name, to: :tag, prefix: true

    def self.ransackable_attributes(auth_object = nil)
      ["created_at", "id", "position", "post_id", "tag_id", "updated_at"]
    end
  end
RUBY

gsub_file 'config/environments/test.rb', /  config.(cache_classes|enable_reloading) = .*$/, <<-RUBY

  config.cache_classes = !ENV['CLASS_RELOADING']
  config.action_mailer.default_url_options = {host: 'example.com'}
  config.assets.precompile += %w( some-random-css.css some-random-js.js a/favicon.ico )

  config.active_record.maintain_test_schema = false

  if Rails::VERSION::MAJOR >= 6
    config.hosts = [
      IPAddr.new("0.0.0.0/0"), # All IPv4 addresses.
      IPAddr.new("::/0"),      # All IPv6 addresses.
      "www.example.com",
      "localhost"              # The localhost reserved domain.
    ]
  end
RUBY

# TODO: remove this line after the STI pre-loading is fixed
# The test commenting.feature/Commenting on a STI subclass fails with zeitwerk autoloader
inject_into_file 'config/environments/test.rb', "\n  config.autoloader = :classic\n", after: 'Rails.application.configure do' if Rails::VERSION::MAJOR == 6

# Override and revert rails/rails#46699 for now
gsub_file "config/database.yml", /storage\/(.+)\.sqlite3$/, 'db/\1.sqlite3'

# Add our local Active Admin to the application
gem 'activeadmin-rails', path: '../..'
gem 'devise', '~> 4.6'

run 'bundle install'

# Setup Active Admin
generate 'active_admin:install'

# Force strong parameters to raise exceptions
inject_into_file 'config/application.rb', after: 'class Application < Rails::Application' do
  "\n    config.action_controller.action_on_unpermitted_parameters = :raise\n"
end

inject_into_file 'app/models/admin_user.rb', '

    def self.ransackable_attributes(auth_object = nil)
      ["created_at", "email", "id", 
       "remember_created_at", "reset_password_sent_at",
       "updated_at"]
    end
', after: 'class AdminUser < ApplicationRecord'

# Add some translations
append_file 'config/locales/en.yml', File.read(File.expand_path('../templates/en.yml', __FILE__))

# Add predefined admin resources
directory File.expand_path('../templates/admin', __FILE__), 'app/admin'

# Add predefined policies
directory File.expand_path('../templates/policies', __FILE__), 'app/policies'

directory File.expand_path("templates/public", __dir__), "public", force: true

if ENV['RAILS_ENV'] != 'test'
  inject_into_file 'config/routes.rb', "\n  root to: redirect('admin')", after: /.*routes.draw do/
end

# Rails 7.1 doesn't write test.sqlite3 files if we run db:drop, db:create and db:migrate in a single command.
rails_command "db:drop db:create", env: ENV["RAILS_ENV"]
rails_command "db:migrate", env: ENV["RAILS_ENV"]

if ENV['INSTALL_PARALLEL']
  inject_into_file 'config/database.yml', "<%= ENV['TEST_ENV_NUMBER'] %>", after: 'test.sqlite3'
end
