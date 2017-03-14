# == Schema Information
#
# Table name: user_points
#
#  id         :integer          not null, primary key
#  score      :integer          default(0)
#  remarks    :text
#  user_id    :integer
#  project_id :string
#  category   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserPoint < ApplicationRecord
  belongs_to :user
  belongs_to :project

  after_save :set_category
  after_save :add_to_remaining_points

  scope :project, -> (project_id) { where(project_id: project_id) }
  scope :user, -> (user_id) { where(user_id: user_id) }
  scope :this_month, -> { where(created_at: Time.now.beginning_of_month..Time.now.end_of_month) }
  scope :this_week, -> { where(created_at: get_week_range) }


  private

  def self.get_week_range
    date = Date.today
    while date.wday != 4  do
      date = date - 1.days
    end
    [date..Date.today]
  end

  def set_category
    if score < 5 && score > 0
      self.update_column(:category, "Shout out")
    elsif score == 5
      self.update_column(:category, "CIT")
    end
  end

  def add_to_remaining_points
    total_points = self.user.remaining_points
    earned_points = self.score
    self.user.update_column(remaining_points: total_points + earned_points)
  end
end
