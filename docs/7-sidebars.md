---
layout: default
nav_order: 7
title: Sidebars
redirect_from: /docs/7-sidebars.html
---
# Sidebar Sections

Sidebars allow you to put whatever content you want on the side of the page.

```ruby
config.add_sidebar_section :help

# app/views/admin/posts/_help_sidebar.html.arb
"Need help? Email us at help@example.com"
```

This will generate a sidebar on every page for that resource. The first
argument is used as the title, and can be a symbol, string, or lambda.

Sidebars can be rendered on a specific action by passing `:only` or `:except`.

```ruby
config.add_sidebar_section :help, only: :index
```

If you want to conditionally display a sidebar section, use the :if option and
pass it a proc which will be rendered within the view context.

```ruby
config.add_sidebar_section :help, if: proc{ current_admin_user.super_admin? }
```

You can access your model as resource in the sidebar too:

```ruby
# app/views/admin/posts/_custom_sidebar.html.arb
resource.a_method
```

You can also override the partial name:

```ruby
config.add_sidebar_section :help                    # app/views/admin/posts/_help_sidebar.html.erb
config.add_sidebar_section :help, partial: 'custom' # app/views/admin/posts/_custom.html.erb
```

It's possible to add custom class name to the sidebar parent element by passing
`class` option:

```ruby
config.add_sidebar_section :help, class: 'custom_class'
```

By default sidebars are positioned in the same order as they defined, but it's also
possible to specify their position manually:

```ruby
# will push Help section to the top (above default Filters section)
config.add_sidebar_section :help, priority: 0
```

Default sidebar priority is `10`.
