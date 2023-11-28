---
layout: default
nav_order: 6
title: Show Pages
redirect_from: /docs/6-show-pages.html
---
# Customize the Show Page

Active Admin renders `:show` using partial `show`

The default partial is located in `app/views/active_admin/resource/_show.html.arb` and simply renders `attributes_panel`

A customized `app/views/admin/posts/_show.html.arb` keeping the default AA look might look like:

```ruby
content_for(:page_title) { resource.name }
attributes_table do
  row :title
  row :image do |ad|
    image_tag ad.image.url
  end
end
active_admin_comments_for(resource)
```

A more generic partial might look like:

```ruby
h3 post.title
div do
  simple_format post.body
end
```

If you want a more data-dense page, you can combine a sidebar:

```ruby
panel "Table of Contents" do
  table_for book.chapters do
    column :number
    column :title
    column :page
  end
end
active_admin_comments_for(resource)
```

and

```ruby
ActiveAdmin.register Book do
  sidebar "Details", only: :show do
    attributes_table_for book do
      row :title
      row :author
      row :publisher
      row('Published?') { |b| status_tag b.published? }
    end
  end
end
```
