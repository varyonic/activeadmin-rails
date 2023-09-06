---
layout: default
nav_order: 10
title: Custom Pages
redirect_from: /docs/10-custom-pages.html
---

# Custom Pages

If you have data you want on a standalone page that isn't tied to a resource,
custom pages provide you with a familiar syntax and feature set:

* a menu item
* sidebars
* action items
* page actions

## Create a new Page

Creating a page is as simple as calling `register_page`:

```ruby
# app/admin/calendar.rb
ActiveAdmin.register_page "Calendar" do
end
```

and defining a partial:

```ruby
# app/views/admin/calendar/_calendar.html.arb
table do
  thead do
    tr do
      %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday].each &method(:th)
    end
  end
  tbody do
    # ...
  end
end
```

## Customize the Menu

See the [Menu](2-resource-customization.md#customize-the-menu) documentation.

## Customize the breadcrumbs

```ruby
ActiveAdmin.register_page "Calendar" do
  breadcrumb do
    ['admin', 'calendar']
  end
end
```

## Customize the Namespace

We use the `admin` namespace by default, but you can use anything:

```ruby
# Available at /today/calendar
ActiveAdmin.register_page "Calendar", namespace: :today

# Available at /calendar
ActiveAdmin.register_page "Calendar", namespace: false
```

## Belongs To

To nest the page within another resource, you can use the `belongs_to` method:

```ruby
ActiveAdmin.register Project
ActiveAdmin.register_page "Status" do
  config.belongs_to :project
end
```

See also the [Belongs To](2-resource-customization.md#belongs-to) documentation
and examples.

## Add a Sidebar

See the [Sidebars](7-sidebars.md) documentation.

## Add an Action Link

Just like other resources, you can add action links.

```ruby
# app/views/admin/calendar/action_item.html.arb
div(class: :action_items) do
  ...
  action_link "View Site", "/"
end
```

## Add a Page Action

Page actions are custom controller actions (which mirror the resource DSL for
the same feature).

```ruby
# admin/calendar.rb
# Defines the route `/admin/calendar/add_event` which can handle HTTP POST requests.
config.add_page_route :add_event, method: :post

# app/controllers/admin/calendar_controller
class Admin::CalendarController < ActiveAdmin::PageController
  def add_event
    # ...
    redirect_to admin_calendar_path, notice: "Your event was added"
  end
end

# app/views/admin/calendar/action_item.html.arb
div(class: :action_items) do
  ...
  action_link "Add Event", admin_calendar_add_event_path, method: :post
end
```

Clicking on the action item will reload page and display the message "Your event
was added"

Page actions can handle multiple HTTP verbs.

```ruby
config.add_page_route :add_event, method: [:get, :post] do
  # ...
end
```

See also the [Custom Actions](8-custom-actions.md#http-verbs) example.

## Use custom column as id

You can use custom parameter instead of id

```ruby
class Admin::User < ActiveAdmin::ResourceController
  defaults finder: :find_by_name
end
```

This defines the resource route as `/admin/users/john` if user name is john
