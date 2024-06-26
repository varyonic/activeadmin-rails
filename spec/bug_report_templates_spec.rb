require 'spec_helper'
require 'open3'

RSpec.describe 'bug_report_templates' do
  subject do
    Bundler.with_unbundled_env do
      Dir.chdir(chdir_path) do
        Open3.capture2e(
          {'ACTIVE_ADMIN_PATH' => active_admin_root},
          Gem.ruby,
          template_path
        )[1]
      end
    end
  end

  let(:active_admin_root) { File.expand_path('../..', __FILE__) }
  let(:chdir_path) { File.join(active_admin_root, 'lib', 'bug_report_templates') }

  context 'when runs active_admin_main.rb' do
    let(:template_path) { 'active_admin_main.rb' }

    it 'passes' do
      expect(subject).to be_truthy
    end
  end

end
