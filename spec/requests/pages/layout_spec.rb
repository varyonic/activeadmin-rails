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

  context "unsupported browser" do
    let(:user_agent) { "Mozilla/5.0 (compatible; MSIE 7.0; Windows NT 6.2; Trident/6.0)" }

    it "should display appropriate text" do
      get edit_user_path(user), headers: { 'HTTP_USER_AGENT' => user_agent }

      pending if ActiveAdmin::Dependency.rails >= '7.2' # Rails 7.2+ provides its own browser warning
      expect(page).to have_css 'div.unsupported_browser h1', text: /no longer supports Internet Explorer versions 8/
      expect(page).to have_css 'div.unsupported_browser p', text: /upgrade your browser/
      expect(page).to have_css 'div.unsupported_browser p', text: /turn off "Compatibility View"/
    end
  end

  it "should not display browser warning by default" do
    get edit_user_path(user)
    expect(page).not_to have_css 'div.unsupported_browser'
  end
end
