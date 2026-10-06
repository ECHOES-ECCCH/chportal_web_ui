require 'spec_helper'

# Every $HOME_PAGE_LOGOS img_src must exist in the asset pipeline,
# otherwise the home page raises AssetNotFound.
RSpec.describe 'Home page logos config' do
  root = File.expand_path('../..', __dir__)
  images_dir = File.join(root, 'app/assets/images')
  img_src_pattern = /img_src:\s*['"]([^'"]+)['"]/
  config_files = %w[config/bioportal_config_development.rb config/bioportal_config_env.rb.sample]

  config_files.each do |config|
    it "#{config} references existing logos" do
      sources = File.read(File.join(root, config)).scan(img_src_pattern).flatten
      missing = sources.reject { |src| File.exist?(File.join(images_dir, src)) }

      expect(missing).to be_empty
    end
  end
end
