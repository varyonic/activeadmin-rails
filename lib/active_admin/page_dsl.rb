module ActiveAdmin
  # This is the class where all the register_page blocks are evaluated.
  class PageDSL < DSL

    # Page content.
    #
    # The block should define the view using Arbre.
    #
    # Example:
    #
    #   ActiveAdmin.register "My Page" do
    #     content do
    #       para "Sweet!"
    #     end
    #   end
    #
    def content(options = {}, &block)
      if block_given?
        config.set_page_presenter :index, ActiveAdmin::PagePresenter.new(options, &block)
      else
        config.set_page_options :index, options
      end
    end

    def page_action(name, options = {}, &block)
      config.page_actions << ControllerAction.new(name, options)

      if block_given?
        controller do
          define_method(name, &block)
        end
      elsif !controller.method_defined?(name)
        controller do
          define_method(name, Proc.new{})
        end
      end
    end

    def belongs_to(target, options = {})
      config.belongs_to(target, options)
    end
  end
end
