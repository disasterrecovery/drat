require 'spec_helper'

describe RecoveryResourceDraft do
  it { should have_and_belong_to_many :categories }
  it { should have_and_belong_to_many :disaster_events }
  it { should have_and_belong_to_many  :entity_type_available_tos }


  it { should allow_mass_assignment_of :description }
  it { should allow_mass_assignment_of :locale }
  it { should allow_mass_assignment_of :name }
  it { should allow_mass_assignment_of :national }
  it { should allow_mass_assignment_of :published }
  it { should allow_mass_assignment_of :recovery_resource_id }
  it { should allow_mass_assignment_of :state }
end
