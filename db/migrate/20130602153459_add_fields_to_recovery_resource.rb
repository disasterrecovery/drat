class AddFieldsToRecoveryResource < ActiveRecord::Migration
  def change
    add_column :recovery_resources, :national, :boolean
    add_column :recovery_resources, :state, :string
    add_column :recovery_resources, :locale, :string
  end
end
