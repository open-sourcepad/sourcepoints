# == Schema Information
#
# Table name: user_project_designations
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  project_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserProjectDesignation < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  validates :user_id, uniqueness: { scope: :project_id }
end
