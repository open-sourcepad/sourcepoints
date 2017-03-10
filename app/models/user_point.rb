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
end
