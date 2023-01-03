module ActiveAdmin
  module Views
    module Pages
      class Page < Arbre::Element

        def build(*args)
          div id: "main_content" do
            main_content
          end
        end

        def main_content
          if page_presenter.block
            block_result = instance_exec(&page_presenter.block)
            text_node block_result unless block_result.is_a? Arbre::Element
          else
            nil
          end
        end

        protected

        def page_presenter
          active_admin_config.get_page_presenter(:index) || ActiveAdmin::PagePresenter.new
        end

        def title
          helpers.page_title
        end
      end
    end
  end
end
