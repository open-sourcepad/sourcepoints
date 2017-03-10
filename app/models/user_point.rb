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

  scope :project, -> (project_id) { where(project_id: project_id) }
  scope :user, -> (user_id) { where(user_id: user_id) }
  scope :this_month, -> { where(created_at: Time.now.beginning_of_month..Time.now.end_of_month) }
  scope :this_week, -> { where(created_at: get_week_range) }


  private

  def self.get_week_range
    date = Date.today
    while date.wday >= 5  do
      date = date - 1.days
    end
    [date..Date.today]
  end
end
