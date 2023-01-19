module ActiveAdmin
  module Views

    class AttributesPanel < ActiveAdmin::Component
      builder_method :attributes_panel
      builder_method :attributes_table # TODO: deprecate

      def build(*args, &block)
        opts = args.extract_options!
        table_title = if opts.has_key?(:title)
                        render_or_call_method_or_proc_on(resource, opts[:title])
                      else
                        ActiveAdmin::Localizers.resource(active_admin_config).t(:details)
                      end
        resource_columns = args.present? ? args : active_admin_config.resource_columns
        panel(table_title) do
          attributes_table_for(resource, *resource_columns, &block)
          active_admin_comments_for(resource) if active_admin_config.comments?
        end
      end
    end
  end
end
