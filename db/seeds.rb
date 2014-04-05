# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
seed_files = []
seed_files = %w[dev_delete_all dev_users dev_players dev_teams] if Rails.env == 'development'

seed_files.each do |f|
  require File.expand_path(File.dirname(__FILE__))+"/seeds/#{f}.rb"
end
