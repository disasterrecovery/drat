class CreateRecoveryResources < ActiveRecord::Migration
  def change
    create_table :recovery_resources do |t|
      t.string :name

      t.timestamps
    end
  end
end
