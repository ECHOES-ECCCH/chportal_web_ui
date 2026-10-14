require 'spec_helper'

# application.css only imports themes/<UI_THEME>/main when that folder exists.
# A theme without it silently drops all lirmm base styles (e.g. the global hr
# reset that keeps .home-section-line left-aligned under section titles).
RSpec.describe 'UI theme config' do
  root = File.expand_path('../..', __dir__)
  theme = File.read(File.join(root, '.env.sample'))[/^UI_THEME=(\S+)/, 1]

  it "has a stylesheet for the #{theme} theme" do
    expect(File).to exist(File.join(root, 'app/assets/stylesheets/themes', theme, 'main.scss'))
  end
end
