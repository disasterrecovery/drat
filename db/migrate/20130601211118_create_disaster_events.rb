class CreateDisasterEvents < ActiveRecord::Migration
  def change
    create_table :disaster_events do |t|
      t.string :name

      t.timestamps
    end
  end
end
