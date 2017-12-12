require 'rails_helper'

RSpec.describe ActiveAdmin::Views::Pages::Index, type: :request do
  include Rails.application.routes.url_helpers

  describe "#title" do
    let!(:application){ ActiveAdmin::Application.new }
    let(:namespace){ application.namespace(:test) }
    let(:page) { Capybara.string(response.body) }

    around do |example|
      with_temp_application(application) { example.call }
      namespace.unload!
      ActiveSupport::Dependencies.clear
    end

    context "when config[:title] is assigned" do
      context "with a Proc" do
        let(:resource) do
          namespace.register User do
            index(title: ->{ "My Page Title" })
          end
        end

        it "should return the value of the assigned Proc" do
          load_resources { resource }
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
          load_resources { resource }
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
          load_resources { resource }
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
        load_resources { resource }
        get resource.route_collection_path
        expect(page.title).to eq "My Page Title"
      end
    end

    context "when page_title is not assigned" do
      let(:resource) do
        namespace.register Post do
        end
      end

      it "should return the correct I18n text" do
        load_resources { resource }
        get resource.route_collection_path
        expect(page.title).to eq "Posts"
      end
    end
  end
end
