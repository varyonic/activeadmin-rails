module ActiveAdmin
  module Views

    class SiteTitle < Component

      def tag_name
        'h1'
      end

      def build(namespace)
        super(id: "site_title")
        text_node site_title_content(namespace)
      end

      private

      def site_title_content(namespace)
        content = namespace.site_title(helpers)
        image = namespace.site_title_image(helpers)
        link = namespace.site_title_link
        
        content = helpers.image_tag(image, id: "site_title_image", alt: content) if image.present?
        content = helpers.link_to(content, link) if link.present?
        content
      end
    end
  end
end
