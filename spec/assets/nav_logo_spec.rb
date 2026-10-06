require 'spec_helper'

# The top nav leaves ~144px for logo + portal name (.nav-items is fixed at 1020px).
# An SVG without width/height renders oversized and pushes the name over "Browse".
RSpec.describe 'Nav logo' do
  max_width = 35
  logo = File.expand_path('../../app/assets/images/logo-white.svg', __dir__)
  size_pattern = ->(attr) { /\s#{attr}="(\d+(?:\.\d+)?)/ }

  it "declares an intrinsic size at most #{max_width}px wide" do
    svg_root = File.read(logo)[/<svg\b[^>]*>/m]
    width = svg_root[size_pattern.call('width'), 1]
    height = svg_root[size_pattern.call('height'), 1]

    expect(height).not_to be_nil
    expect(width).not_to be_nil
    expect(width.to_f).to be <= max_width
  end
end
