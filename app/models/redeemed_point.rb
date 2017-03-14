# == Schema Information
#
# Table name: redeemed_points
#
#  id            :integer          not null, primary key
#  redeemable_id :integer
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class RedeemedPoint < ApplicationRecord
  belongs_to :redeemable
  belongs_to :user
end
