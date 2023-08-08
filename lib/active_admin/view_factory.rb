require 'active_admin/abstract_view_factory'

module ActiveAdmin
  class ViewFactory < AbstractViewFactory

    # Register Helper Renderers
    register  site_title:          ActiveAdmin::Views::SiteTitle,
              index_scopes:        ActiveAdmin::Views::Scopes
  end
end
