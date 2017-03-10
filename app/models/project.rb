# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Project < ApplicationRecord
  has_many :user_project_designations
  has_many :users, through: :user_project_designations
  has_many :user_points

  accepts_nested_attributes_for :user_project_designations, :allow_destroy => true
end
