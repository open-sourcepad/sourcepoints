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

  after_save :deduct_points

  validate :enough_points

  def deduct_points
    points = self.user.remaining_points - self.redeemable.points
    if points >= 0
      self.user.update_attributes(remaining_points: points)
    end
  end

  def enough_points
    points = self.user.remaining_points - self.redeemable.points
    if points < 0
      errors.add(:remaining_points, "is insufficient.")
    end
  end
end
