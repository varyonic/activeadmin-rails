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
        when :index
          if PageController === controller
            if page_presenter[:title]
              render_or_call_method_or_proc_on self, page_presenter[:title]
            else
              active_admin_config.name
            end
          else
            if Proc === page_presenter[:title]
              controller.instance_exec &page_presenter[:title]
            else
              page_presenter[:title] || assigns[:page_title] || active_admin_config.plural_resource_label
            end
          end
        when :show
          if page_presenter[:title]
            render_or_call_method_or_proc_on(resource, page_presenter[:title])
          else
            assigns[:page_title] || begin
              title = display_name(resource)
              title = "#{active_admin_config.resource_label} ##{resource.id}" if title.blank?
              title
            end
          end
        when :new, :edit
          if page_presenter[:title]
            render_or_call_method_or_proc_on(resource, page_presenter[:title])
          else
            normalized_action = case params[:action]
            when "create"
              "new"
            when "update"
              "edit"
            else
              params[:action]
            end
            assigns[:page_title] || ActiveAdmin::Localizers.resource(active_admin_config).t("#{normalized_action}_model")
          end
        else
          assigns[:page_title] || I18n.t("active_admin.#{params[:action]}", default: params[:action].to_s.titleize)
        end
      end

      def page_presenter
        case params[:action].to_sym
        when :index
          if PageController === controller
            active_admin_config.get_page_presenter(:index) || ActiveAdmin::PagePresenter.new
          else
            active_admin_config.get_page_presenter(:index, params[:as]) || ActiveAdmin::PagePresenter.new(as: :table)
          end
        when :show
          active_admin_config.get_page_presenter(:show) || ActiveAdmin::PagePresenter.new
        when :new, :edit
          active_admin_config.get_page_presenter(:form) ||
          ActiveAdmin::PagePresenter.new do |f|
            f.semantic_errors # show errors on :base by default
            f.inputs
            f.actions
          end
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
