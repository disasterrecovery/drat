class RecoveryResourceDraft < ActiveRecord::Base
  attr_accessible :description, :locale, :name, :national, :published, :recovery_resource_id, :state
end
