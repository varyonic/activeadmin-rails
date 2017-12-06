require 'rails_helper'

RSpec.describe ActiveAdmin::Views::Pages::Base do
  class NewPage < ActiveAdmin::Views::Pages::Base
  end

  it "defines a default title" do
    expect(NewPage.new.title).to eq 'NewPage'
  end

  it "defines default main content" do
    expect(NewPage.new.main_content).to eq 'Please implement NewPage#main_content to display content.'
  end

  let(:assigns) { Hash.new }
  let(:helpers) do
    helpers = mock_action_view

    {
      active_admin_config:        double('Config', action_items?: nil, breadcrumb: nil, sidebar_sections?: nil),
      active_admin_namespace:     ActiveAdmin.application.namespace(:admin),
      csrf_meta_tag:              '',
      current_active_admin_user?: false,
      current_menu:               double('Menu', items: []),
      params:                     {controller: 'UsersController', action: 'edit'},
    }
    .each do |method, returns|
      allow(helpers).to receive(method).and_return returns
    end
    helpers
  end

  let(:layout) do
    render_arbre_component assigns, helpers do
      insert_tag(ActiveAdmin::Views::Pages::Base, 'main content element')
    end
  end

  it "renders the content block" do
    expect(layout.to_s).to match /main content element/
  end
end
