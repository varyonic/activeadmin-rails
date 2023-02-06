require 'rails_helper'

RSpec.describe 'views/resources/edit, new', type: :request do
  include Rails.application.routes.url_helpers

  describe "#title" do
    let!(:application) { ActiveAdmin::Application.new }
    let(:namespace) { application.namespace(:root) { |n| n.site_title = nil } }
    let(:page) { Capybara.string(response.body) }

    around do |example|
      with_temp_application(application) do
        load_resources { resource }
        example.call
      end
      namespace.unload!
    end

    context "when :title is set" do
      let(:resource) do
        namespace.register User do
          form(title: "My Page Title")
        end
      end

      it "should show the set page title" do
        get new_user_path
        expect(page.title).to eq "My Page Title"
      end
    end

    context "when page_title is assigned" do
      let(:resource) do
        namespace.register User do
          controller do
            def new
              @page_title = "My Page Title"
              new!
            end
          end
        end
      end

      it "should show the set page title" do
        get new_user_path
        expect(page.title).to eq "My Page Title"
      end
    end

    context "when page_title is not assigned" do
      let(:resource) do
        namespace.register Post do
        end
      end
      let(:post){ Post.create! }

      it "should show the correct I18n text on the new action" do
        get new_post_path
        expect(page).to have_css 'head title', text: /New Post/, count: 1, visible: false
        expect(page.title).to eq 'New Post'
      end

      it "should show the correct I18n text on the edit action" do
        get edit_post_path(post)

        expect(page).to have_css 'head title', text: /Edit Post/, count: 1, visible: false
        expect(page).to have_css 'body.active_admin', count: 1
        expect(page).to have_css "body.#{namespace.name}_namespace", count: 1
        expect(page.title).to eq 'Edit Post'
      end
    end
  end
end
