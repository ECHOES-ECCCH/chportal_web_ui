require 'spec_helper'
require_relative '../../app/helpers/home_helper'

# Only the current portal shows its own logo in "Other OntoPortal instances";
# the others keep the generic OntoPortal logo.
RSpec.describe HomeHelper do
  subject(:helper) do
    Class.new do
      include HomeHelper

      def portal_name
        'CHPortal'
      end
    end.new
  end

  describe '#instance_logo' do
    it 'uses the portal logo for the current portal' do
      expect(helper.instance_logo('chportal')).to eq('logo-white.svg')
    end

    it 'uses the OntoPortal logo for other portals' do
      expect(helper.instance_logo('AgroPortal')).to eq('logos/ontoportal.svg')
    end
  end
end
