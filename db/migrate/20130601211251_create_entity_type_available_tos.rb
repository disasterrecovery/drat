class CreateEntityTypeAvailableTos < ActiveRecord::Migration
  def change
    create_table :entity_type_available_tos do |t|
      t.string :name

      t.timestamps
    end
  end
end
