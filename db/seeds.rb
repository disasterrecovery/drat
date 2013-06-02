# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

seed_file = File.join(Rails.root, 'db', 'seed.yml')
data = YAML::load_file(seed_file)
