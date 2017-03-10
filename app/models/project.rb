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

  before_destroy :destroy_user_points

  def get_accumulated_points
    accumulated = 0

    self.users.each do |user|
      user.user_points.each do |points|
        if points.created_at.beginning_of_week == DateTime.current.beginning_of_week
          accumulated += points.score
        end
      end
    end
    accumulated
  end

  private

  def destroy_user_points
    user_points = UserPoint.where(project_id: self.id)
    if user_points.any?
      user_points.destroy_all
    end
  end

end
