class RecoveryResource < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :disaster_events
  has_and_belongs_to_many :entity_type_available_tos

  attr_accessible :name
end
