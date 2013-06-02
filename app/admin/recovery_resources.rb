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

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :categories
      f.input :disaster_events
      f.input :entity_type_available_tos
    end

    f.actions
  end
end
