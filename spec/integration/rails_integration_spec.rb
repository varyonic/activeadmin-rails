require 'rails_helper'

RSpec.describe 'Rails/ActiveAdmin integration' do
  it 'unloads and reloads ActiveAdmin only once' do
    allow(ActiveAdmin.application).to receive(:unload!)
    allow(ActiveAdmin.application).to receive(:load!)

    Rails.application.reloader.reload!

    expect(ActiveAdmin.application).to have_received(:unload!).once
    expect(ActiveAdmin.application).to have_received(:load!).once
  end
end
