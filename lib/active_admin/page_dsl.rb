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
      define_controller_method(name, &block)

      config.add_page_route(name, options)
    end

    def belongs_to(target, options = {})
      config.belongs_to(target, options)
    end
  end
end
