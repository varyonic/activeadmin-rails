require 'rails_helper'

RSpec.describe 'layout', type: :request do
  include Rails.application.routes.url_helpers

  let(:application){ ActiveAdmin::Application.new }
  let(:namespace) { application.namespace(:root) }
  let(:resource) { namespace.register User }
  let(:page) { Capybara.string(response.body) }
  let(:user) { User.create! }

  around do |example|
    with_temp_application(application) do
      load_resources { resource }
      example.call
    end
    namespace.unload!
  end

  describe "the head" do

    it "should have title tag" do
      get edit_user_path(user)

      expect(page).to have_css 'head title', text: /Edit User \|/, count: 1, visible: false
    end
  end

  describe "the body" do

    it "should have class 'active_admin'" do
      get edit_user_path(user)
      expect(page).to have_css 'body.active_admin', count: 1
    end

    it "should have namespace class" do
      get edit_user_path(user)
      expect(page).to have_css "body.#{namespace.name}_namespace", count: 1
    end

  end

end
