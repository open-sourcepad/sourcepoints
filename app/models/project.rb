# == Schema Information
#
# Table name: projects
#
#  id           :integer          not null, primary key
#  project_name :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Project < ActiveRecord::Base
  has_many :user_project_designations
  has_many :users, through: :user_project_designations
end
