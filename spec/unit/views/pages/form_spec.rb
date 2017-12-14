require 'rails_helper'

RSpec.describe ActiveAdmin::Views::Pages::Form, type: :request do
  include Rails.application.routes.url_helpers

  describe "#title" do
    let!(:application){ ActiveAdmin::Application.new }
    let(:namespace){ application.namespace(:test) }
    let(:page) { Capybara.string(response.body) }
    let(:post) { Post.create! }

    around do |example|
      with_temp_application(application) { example.call }
      namespace.unload!
    end

    context "when :title is set" do
      let(:resource) do
        namespace.register Post do
          form title: "My Page Title"
        end
      end

      it "should show the set page title" do
        load_resources { resource }
        get new_test_post_path
        expect(page.title).to eq "My Page Title"
      end
    end

    context "when page_title is assigned" do
      let(:resource) do
        namespace.register Post do
          controller do
            def new
              @page_title = "My Page Title"
              new!
            end
          end
        end
      end

      it "should return the set page title" do
        load_resources { resource }
        get new_test_post_path
        expect(page.title).to eq "My Page Title"
      end
    end

    context "when page_title is not assigned" do
      let(:resource) do
        namespace.register Post do
        end
      end

      it "should return the correct I18n text for new" do
        load_resources { resource }
        get new_test_post_path
        expect(page.title).to eq "New Post"
      end
      it "should return the correct I18n text for edit" do
        load_resources { resource }
        get edit_test_post_path(post.id)
        expect(page.title).to eq "Edit Post"
      end
    end
  end
end
