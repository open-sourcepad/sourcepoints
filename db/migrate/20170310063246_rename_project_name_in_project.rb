class RenameProjectNameInProject < ActiveRecord::Migration[5.0]
  def change
    rename_column :projects, :project_name, :name
  end
end
