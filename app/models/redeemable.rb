# == Schema Information
#
# Table name: redeemables
#
#  id         :integer          not null, primary key
#  name       :string
#  points     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Redeemable < ApplicationRecord
  belongs_to :redeemed_point
end
