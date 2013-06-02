require 'spec_helper'

describe EntityTypeAvailableTo do

  context "#database" do
    it { should have_and_belong_to_many :recovery_resources }
    it { should allow_mass_assignment_of :name }
  end

end
