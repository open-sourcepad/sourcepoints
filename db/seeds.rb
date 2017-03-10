# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Project.destroy_all

['SMS360', 'Blikee', 'GrowthHacker', 'Commutyble', 'School Insider', 'Slips', 'WePlanr', 'ParishFind', 'GolfCrow', 'Accounting & HR'].each do |project|
  Project.create(name: project)
end

User.destroy_all
['topo', 'gene', 'pr', 'dj', 'andy'].each do |user|
  new_user = User.new(nickname: user, password: 'password', email: "#{user}@sourcepad.com", role: 'admin')
  new_user.save
end

UserProjectDesignation.destroy_all
UserProjectDesignation.create(user_id: User.find_by(nickname: 'topo').id, project_id: Project.find_by(name: 'SMS360').id)
UserProjectDesignation.create(user_id: User.find_by(nickname: 'gene').id, project_id: Project.find_by(name: 'SMS360').id)
UserProjectDesignation.create(user_id: User.find_by(nickname: 'pr').id, project_id: Project.find_by(name: 'SMS360').id)

UserProjectDesignation.create(user_id: User.find_by(nickname: 'dj').id, project_id: Project.find_by(name: 'GrowthHacker').id)
UserProjectDesignation.create(user_id: User.find_by(nickname: 'andy').id, project_id: Project.find_by(name: 'Blikee').id)
