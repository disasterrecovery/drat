# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

seed_file = File.join(Rails.root, 'db', 'seed.yml')
data = YAML::load_file(seed_file)

AdminUser.create!(:email => 'admin@drat.com', :password => 'ch@nge,me!', :password_confirmation => 'ch@nge,me!')

EntityTypeAvailableTo.create(data['entity_types'])
Category.create(data['categories'])
DisasterEvent.create(data['events'])

puts "All Done!"
