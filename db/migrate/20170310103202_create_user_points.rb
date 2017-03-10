class CreateUserPoints < ActiveRecord::Migration[5.0]
  def change
    create_table :user_points do |t|
      t.integer :score, default: 0
      t.text :remarks
      t.integer :user_id
      t.string :project_id
      t.string :category

      t.timestamps
    end
  end
end
