module ActiveAdmin
  module ViewHelpers
    module BreadcrumbHelper

      # Returns an array of links to use in a breadcrumb
      def breadcrumb_links(path = request.path)
        setting = active_admin_config.breadcrumb

        if setting.blank?
          nil
        elsif setting.is_a?(Proc)
          instance_exec(controller, &setting)
        else
          default_breadcrumb_links(path)
        end
      end

      GUID_REGEX = '(?:[a-f0-9]{8}-(?:[a-f0-9]{4}-){3}[a-f0-9]{12})'
      ID_REGEX = '\d+|[a-f0-9]{24}|' + GUID_REGEX

      def default_breadcrumb_links(path)
        # remove leading "/" and split up the URL
        # and remove last since it's used as the page title
        parts = path.split('/').select(&:present?)[0..-2]

        parts.each_with_index.map do |part, index|
          config = breadcrumb_part_config(parts[index-1]) if part.match?(/\A(#{ID_REGEX})\z/)

          # 1. try using `display_name` if we can locate a DB object
          # 2. try using the model name translation
          # 3. default to calling `titlecase` on the URL fragment
          name = config && display_name(config.find_resource part)
          name ||= I18n.t "activerecord.models.#{part.singularize}", count: ::ActiveAdmin::Helpers::I18n::PLURAL_MANY_COUNT, default: part.titlecase

          # Don't create a link if the resource's show action is disabled
          if !config || config.defined_actions.include?(:show)
            link_to name, '/' + parts[0..index].join('/')
          else
            name
          end
        end
      end

      def breadcrumb_part_config(parent_part)
        config = active_admin_config
        parent = config.belongs_to_config.try :target
        parent && parent.resource_name.route_key == parent_part ? parent :  config
      end

    end
  end
end
