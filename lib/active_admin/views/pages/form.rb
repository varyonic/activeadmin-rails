module ActiveAdmin
  module Views
    module Pages

      class Form < ActiveAdmin::Component

        builder_method :form_page_main_content

        def build
          options = default_form_options.merge form_presenter.options

          if options[:partial]
            render options[:partial]
          else
            active_admin_form_for resource, options, &form_presenter.block
          end
        end

        private

        def default_form_options
          {
            url: default_form_path,
            as: active_admin_config.param_key
          }
        end

        def default_form_path
          resource.persisted? ? resource_path(resource) : collection_path
        end
      end

    end
  end
end
