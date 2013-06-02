require 'spec_helper'

describe RecoveryResource do

  context "#database" do
    it { should have_and_belong_to_many :categories }
    it { should have_and_belong_to_many :disaster_events }
    it { should have_and_belong_to_many :entity_type_available_tos }

    it { should allow_mass_assignment_of :name }
    it { should allow_mass_assignment_of :national }
    it { should allow_mass_assignment_of :state }
    it { should allow_mass_assignment_of :locale }
    it { should allow_mass_assignment_of :category_ids }
    it { should allow_mass_assignment_of :disaster_event_ids }
    it { should allow_mass_assignment_of :entity_type_available_to_ids }
  end

end
