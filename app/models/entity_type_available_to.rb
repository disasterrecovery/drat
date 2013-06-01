class EntityTypeAvailableTo < ActiveRecord::Base
  has_and_belongs_to_many :recovery_resources

  attr_accessible :name
end
