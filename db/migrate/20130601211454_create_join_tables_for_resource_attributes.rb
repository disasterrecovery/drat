class CreateJoinTablesForResourceAttributes < ActiveRecord::Migration
  def self.up
    create_table :categories_recovery_resources, :id => false do |t|
        t.references :category
        t.references :recovery_resource
    end
    add_index :categories_recovery_resources, [:category_id, :recovery_resource_id]
    add_index :categories_recovery_resources, :recovery_resource_id


    create_table :disaster_events_recovery_resources, :id => false do |t|
        t.references :disaster_event
        t.references :recovery_resource
    end
    add_index :disaster_events_recovery_resources, [:disaster_event_id, :recovery_resource_id]
    add_index :disaster_events_recovery_resources, :recovery_resource_id


    create_table :entity_type_available_tos_recovery_resources, :id => false do |t|
        t.references :entity_type_available_to
        t.references :recovery_resource
    end
    add_index :entity_type_available_tos_recovery_resources, [:entity_type_available_to_id, :recovery_resource_id]
    add_index :categories_recovery_resources, :recovery_resource_id
  end

  def self.down
    drop_table :categories_recovery_resources
    drop_table :disaster_events_recovery_resources
    drop_table :entity_type_available_tos_recovery_resources
  end
end
