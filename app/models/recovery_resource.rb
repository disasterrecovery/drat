class RecoveryResource < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :disaster_events
  has_and_belongs_to_many :entity_type_available_tos

  has_many :recovery_resource_drafts

  attr_accessible :name, :national, :state, :locale,
    :category_ids, :disaster_event_ids, :entity_type_available_to_ids

end
