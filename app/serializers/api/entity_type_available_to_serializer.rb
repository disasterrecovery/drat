class Api::EntityTypeAvailableToSerializer < ActiveModel::Serializer
  self.root = "available_tos"
  attributes :id, :name
end
