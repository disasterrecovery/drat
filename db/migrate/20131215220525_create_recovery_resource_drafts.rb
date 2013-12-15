class CreateRecoveryResourceDrafts < ActiveRecord::Migration
  def change
    create_table :recovery_resource_drafts do |t|
      t.string :name
      t.boolean :national
      t.string :state
      t.string :locale
      t.text :description
      t.boolean :published
      t.integer :recovery_resource_id

      t.timestamps
    end
  end
end
