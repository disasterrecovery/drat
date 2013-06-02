class API::RecoveryResourceSerializer < ActiveModel::Serializer
  self.root = false
  attributes :id, :name, :national, :state, :locale

  has_many :categories, serializer: Api::CategorySerializer
  has_many :disaster_events, serializer: Api::DisasterEventSerializer
  has_many :entity_type_available_tos, serializer: Api::EntityTypeAvailableToSerializer, key: "available_to"
end
