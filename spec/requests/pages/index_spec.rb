require 'rails_helper'

RSpec.describe 'views/resource/index', type: :request do
  include Rails.application.routes.url_helpers

  let(:application){ ActiveAdmin::Application.new }
  let(:namespace) { application.namespace(:root) { |n| n.site_title = nil } }
  let(:resource) { namespace.register Post }
  let(:page) { Capybara.string(response.body) }

  around do |example|
    with_temp_application(application) do
      load_resources { resource }
      example.call
    end
    namespace.unload!
  end

  describe "#title" do
    context "when config[:title] is assigned" do
      context "with a Proc" do
        let(:resource) do
          namespace.register User do
            index(title: ->{ "My Page Title" })
          end
        end

        it "should return the value of the assigned Proc" do
          get resource.route_collection_path
          expect(page.title).to eq "My Page Title"
        end
      end

      context "with a String" do
        let(:resource) do
          namespace.register User do
            index(title: "My Page Title")
          end
        end

        it "should return the assigned String" do
          get resource.route_collection_path
          expect(page.title).to eq "My Page Title"
        end
      end

      context "with a Integer" do
        let(:resource) do
          namespace.register User do
            index(title: 1)
          end
        end

        it "should return the Integer" do
          get resource.route_collection_path
          expect(page.title).to eq '1'
        end
      end
    end

    context "when page_title is assigned" do
      let(:resource) do
        namespace.register User do
          controller do
            def index
              @page_title = "My Page Title"
              index!
            end
          end
        end
      end

      it "should return the set page title" do
        get resource.route_collection_path
        expect(page.title).to eq "My Page Title"
      end
    end

    context "when page_title is not assigned" do
      it "should return the correct I18n text" do
        get resource.route_collection_path

        expect(page).to have_css 'head title', text: /Posts/, count: 1, visible: false
        expect(page.title).to eq 'Posts'
      end
    end
  end

  describe "#sidebar" do
    it "displays sidebar by default" do
      get resource.route_collection_path
      expect(page).to have_css 'div.sidebar#sidebar'
      expect(page).to have_css 'form.filter_form[method=get]'
    end
  end
end
