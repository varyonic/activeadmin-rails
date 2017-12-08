module ActiveAdmin
  module ViewHelpers
    module LayoutHelper

      def action_items_for_action
        if active_admin_config && active_admin_config.action_items?
          active_admin_config.action_items_for(params[:action], self)
        else
          []
        end
      end

      def body_classes
        Arbre::HTML::ClassList.new [
          params[:action],
          params[:controller].tr('/', '_'),
          'active_admin', 'logged_in',
          active_admin_namespace.name.to_s + '_namespace'
        ]
      end

      def page_title
        params[:action].to_sym == :index ? page_page_title : custom_action_page_title
      end

      def page_page_title
        if page_presenter[:title]
          render_or_call_method_or_proc_on self, page_presenter[:title]
        else
          active_admin_config.name
        end
      end

      def custom_action_page_title
        assigns[:page_title] ||= I18n.t("active_admin.#{params[:action]}", default: params[:action].to_s.titleize)
      end

      def page_presenter
        active_admin_config.get_page_presenter(:index) || ActiveAdmin::PagePresenter.new
      end

      # Returns the sidebar sections to render for the current action
      def sidebar_sections_for_action
        if active_admin_config && active_admin_config.sidebar_sections?
          active_admin_config.sidebar_sections_for(params[:action], self)
        else
          []
        end
      end
    end
  end
end
