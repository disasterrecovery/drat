class CreateJoinTablesForResourceDraftAttributes < ActiveRecord::Migration
  def self.up
    create_table :categories_recovery_resource_drafts, :id => false do |t|
        t.references :category
        t.references :recovery_resource_draft
    end
    add_index :categories_recovery_resource_drafts, [:category_id, :recovery_resource_draft_id], name: 'index_on_cat_id_and_draft_id'
    add_index :categories_recovery_resource_drafts, :recovery_resource_draft_id, name: 'index_cats_resources_on_draft_id'


    create_table :disaster_events_recovery_resource_drafts, :id => false do |t|
        t.references :disaster_event
        t.references :recovery_resource_draft
    end
    add_index :disaster_events_recovery_resource_drafts, [:disaster_event_id, :recovery_resource_draft_id], name: 'index_on_event_id_and_draft_id'
    add_index :disaster_events_recovery_resource_drafts, :recovery_resource_draft_id, name: 'index_events_resources_on_draft_id'


    create_table :entity_type_available_tos_recovery_resource_drafts, :id => false do |t|
        t.references :entity_type_available_to
        t.references :recovery_resource_draft
    end
    add_index :entity_type_available_tos_recovery_resource_drafts, [:entity_type_available_to_id, :recovery_resource_draft_id], name: 'index_on_entity_id_and_draft_id'
    add_index :entity_type_available_tos_recovery_resource_drafts, :recovery_resource_draft_id, name: 'index_entities_resources_on_draft_id'
  end

  def self.down
    drop_table :categories_recovery_resource_drafts
    drop_table :disaster_events_recovery_resource_drafts
    drop_table :entity_type_available_tos_recovery_resource_drafts
  end
end
