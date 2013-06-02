class API::RecoveryResourceSerializer < ActiveModel::Serializer
  self.root = false
  attributes :id, :name, :national, :state, :locale, :categories, :disaster_events, :available_to

  def categories
    object.categories.map { |cat| cat.name }
  end

  def disaster_events
    object.disaster_events.map { |de| de.name }
  end

  def available_to
    object.entity_type_available_tos.map { |etat| etat.name }
  end

end
