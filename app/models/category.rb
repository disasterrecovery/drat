class Category < ActiveRecord::Base
  has_and_belongs_to_many :recovery_resources
  has_and_belongs_to_many :recovery_resource_drafts

  attr_accessible :name
end
