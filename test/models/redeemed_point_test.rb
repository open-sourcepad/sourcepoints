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

require 'test_helper'

class RedeemedPointTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
