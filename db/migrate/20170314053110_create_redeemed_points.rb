class CreateRedeemedPoints < ActiveRecord::Migration[5.0]
  def change
    create_table :redeemed_points do |t|
      t.integer :redeemable_id
      t.integer :user_id

      t.timestamps
    end
  end
end
