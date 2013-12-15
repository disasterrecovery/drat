class RecoveryResourceDraft < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :disaster_events
  has_and_belongs_to_many :entity_type_available_tos

  belongs_to :recovery_resource

  attr_accessible :description, :locale, :name, :national, :published, :recovery_resource_id, :state
end
