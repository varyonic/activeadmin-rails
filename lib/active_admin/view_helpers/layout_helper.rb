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
        case params[:action].to_sym
        when :show
          config = active_admin_config.get_page_presenter(:show) || {}

          if config[:title]
            render_or_call_method_or_proc_on(resource, config[:title])
          else
            assigns[:page_title] || begin
              title = display_name(resource)
              title = "#{active_admin_config.resource_label} ##{resource.id}" if title.blank?
              title
            end
          end
        else
          assigns[:page_title] || I18n.t("active_admin.#{params[:action]}", default: params[:action].to_s.titleize)
        end
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
