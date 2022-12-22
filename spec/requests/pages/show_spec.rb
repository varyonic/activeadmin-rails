require 'rails_helper'

RSpec.describe ActiveAdmin::Views::Pages::Show, type: :request do
  include Rails.application.routes.url_helpers

  let!(:application) { ActiveAdmin::Application.new }
  let(:namespace) { application.namespace(:root) { |n| n.site_title = nil } }
  let(:page) { Capybara.string(response.body) }
  let(:post) { Post.create! }

  around do |example|
    with_temp_application(application) do
      load_resources { resource }
      example.call
    end
    namespace.unload!
  end

  describe "the resource" do
    let(:resource) do
      namespace.register Post do
        show do |post|
          attributes_table_for(post) do
            row :field
          end
        end
      end
    end

    it "renders the page" do
      get post_path(post)
      expect(page).to have_css 'div#main_content', count: 1
      expect(page).to have_css 'div.attributes_table tr.row-field th', text: /Field/
    end

  end

end
