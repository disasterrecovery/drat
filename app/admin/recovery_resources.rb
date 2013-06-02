require 'carmen'
include Carmen

ActiveAdmin.register RecoveryResource do
  menu priority: 2

  index do
    column :name
    column 'Categories' do |resource|
      list = ''
      for category in resource.categories
        list += "#{category.name}, "
      end
      list.chomp(', ')
    end

    default_actions
  end

  show do |resource|
    attributes_table do
      row :name
      row :national
      row :state
      row :locale
      # row :categories
    end
    active_admin_comments
  end

  form do |f|
    f.inputs 'Details' do
      f.input :name
      f.input :national
      f.input :state, :as => :select, :collection => Country.named('United States').subregions
      f.input :locale
    end
    f.inputs 'Filtering' do
      f.input :categories
      f.input :disaster_events
      f.input :entity_type_available_tos
    end

    f.actions
  end
end
