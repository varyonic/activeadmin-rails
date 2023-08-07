---
layout: default
nav_order: 4
title: CSV Format
redirect_from: /docs/4-csv-format.html
---

# Customizing the CSV format

Active Admin provides CSV file downloads on the index screen for each Resource.
By default it will render a CSV file with all the content columns of your
registered model.

To customize the CSV format override [csv_builder]:

```ruby
class Admin::PostsController < ActiveAdmin::ResourceController
  protected
  def csv_builder
    @csv_builder ||= ActiveAdmin::CSVBuilder.new(resource: active_admin_config) do
      column :title
      column(:author) { |post| post.author.full_name }
      column('bODY', humanize_name: false) # preserve case
    end
  end
end
```

You can also set custom CSV settings:

```ruby
class Admin::PostsController < ActiveAdmin::ResourceController
  protected
  def csv_builder
    @csv_builder ||= ActiveAdmin::CSVBuilder.new(resource: active_admin_config, force_quotes: true, col_sep: ';', column_names: false) do
      column :title
      column(:author) { |post| post.author.full_name }
    end
  end
end
```

Or system-wide in `config/initializers/active_admin.rb`:

```ruby
Rails.application.reloader.to_prepare do
  ActiveAdmin.setup do |config|
    # Set the CSV builder separator
    config.csv_options = { col_sep: ';' }
    # Force the use of quotes
    config.csv_options = { force_quotes: true }
    ...
  ```

You can customize the filename by overriding `csv_filename` in the controller block.

```ruby
class Admin::UsersController < ActiveAdmin::ResourceController
  protected
    def csv_filename
      'User Details.csv'
    end
  end
end
```

## Streaming

By default Active Admin streams the CSV response to your browser as it's generated.
This is good because it prevents request timeouts, for example the infamous H12
error on Heroku.

However if an exception occurs while generating the CSV, the request will eventually
time out, with the last line containing the exception message. CSV streaming is
disabled in development to help debug these exceptions. That lets you use tools like
better_errors and web-console to debug the issue. If you want to customize the
environments where CSV streaming is disabled, you can change this setting in `config/initializers/active_admin.rb`:

```ruby
ActiveAdmin.setup do |config|
  config.disable_streaming_in = ['development', 'staging']
  ...
```

[csv_builder]: https://rubydoc.info/github/varyonic/activeadmin/master/ActiveAdmin/ResourceController/Streaming#csv_builder-instance_method
[csv_filename]: https://rubydoc.info/github/varyonic/activeadmin/master/ActiveAdmin/ResourceController/Streaming#csv_filename-instance_method
