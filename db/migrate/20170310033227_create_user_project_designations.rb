class CreateUserProjectDesignations < ActiveRecord::Migration
  def change
    create_table :user_project_designations do |t|
      t.integer :user_id
      t.integer :project_id
      
      t.timestamps null: false
    end
  end
end
