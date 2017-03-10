# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

['SMS360', 'Blikee', 'GrowthHacker'].each do |project|
  Project.first_or_create(name: project)
end

['topo', 'gene', 'pr'].each do |user|
  new_user = User.first_or_create(nickname: user, password: 'password', email: "#{user}@sourcepad.com", role: 'admin')
  new_user.skip_confirmation!
  new_user.save!
end
