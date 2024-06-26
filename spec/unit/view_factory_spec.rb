require 'rails_helper'

def it_should_have_view(key, value)
  it "should have #{value} for view key '#{key}'" do
    expect(subject.send(key)).to eq value
  end
end

RSpec.describe ActiveAdmin::ViewFactory do

  it_should_have_view :site_title,           ActiveAdmin::Views::SiteTitle

end
