module ActiveAdmin
  module Views
    class ActionLink < Arbo::HTML::Span
      builder_method :action_link

      def build(name, path, options = {})
        @tag_name = 'span'
        set_attribute(:class, :action_item)
        text_node link_to(localizer.t(name), path, options)
      end
    end
  end
end
