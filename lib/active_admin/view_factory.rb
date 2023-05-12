require 'active_admin/abstract_view_factory'

module ActiveAdmin
  class ViewFactory < AbstractViewFactory

    # Register Helper Renderers
    register  global_navigation:   ActiveAdmin::Views::TabbedNavigation,
              utility_navigation:  ActiveAdmin::Views::TabbedNavigation,
              site_title:          ActiveAdmin::Views::SiteTitle,
              unsupported_browser: ActiveAdmin::Views::UnsupportedBrowser,
              action_items:        ActiveAdmin::Views::ActionItems,
              header:              ActiveAdmin::Views::Header,
              footer:              ActiveAdmin::Views::Footer,
              index_scopes:        ActiveAdmin::Views::Scopes
  end
end
