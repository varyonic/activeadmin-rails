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
        case controller
        when ResourceController
          if page_presenter[:title]
            case params[:action].to_sym
            when :index
              case page_presenter[:title]
              when Symbol, Proc
                controller.instance_exec(&page_presenter[:title])
              else
                page_presenter[:title]
              end
            else
              render_or_call_method_or_proc_on(resource, page_presenter[:title])
            end
          else
            default_page_title
          end
        else
          if page_presenter[:title]
            render_or_call_method_or_proc_on(self, page_presenter[:title])
          else
            default_page_title
          end
        end
      end

      def default_page_title
        case controller
        when ResourceController
          case params[:action].to_sym
          when :index
            active_admin_config.plural_resource_label
          when :show
            display_name(resource).present? ?
              display_name(resource) :
              "#{active_admin_config.resource_label} ##{resource.id}"
          when :new, :edit
            normalized_action = params[:action]
            normalized_action = 'new' if normalized_action == 'create'
            normalized_action = 'edit' if normalized_action == 'update'

            ActiveAdmin::Localizers.resource(active_admin_config).t("#{normalized_action}_model")
          else
            I18n.t("active_admin.#{params[:action]}", default: params[:action].to_s.titleize)
          end
        else
          active_admin_config.name
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
