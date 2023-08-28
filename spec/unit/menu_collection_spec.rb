require 'rails_helper'

RSpec.describe ActiveAdmin::MenuCollection do

  let(:menus) { ActiveAdmin::MenuCollection.new }

  describe "#add" do

    it "should initialize a new menu when first item" do
      menus.add :default, label: "Hello World"

      expect(menus.fetch(:default).items.size).to eq 1
      expect(menus.fetch(:default)["Hello World"]).to be_an_instance_of(ActiveAdmin::MenuItem)
    end

    it "should add items to an existing menu" do
      menus.add :default, label: "Hello World"
      menus.add :default, label: "Hello World Again"

      expect(menus.fetch(:default).items.size).to eq 2
    end

  end

  describe "#clear!" do

    it "should remove all menus" do
      menus.add :default, label: "Hello World"

      menus.clear!

      expect {
        menus.fetch(:non_default_menu)
      }.to raise_error(ActiveAdmin::NoMenuError)

    end

  end

end
