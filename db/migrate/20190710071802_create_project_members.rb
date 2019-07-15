class CreateProjectMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :project_members do |t|
      t.references :project, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.string :role, null: false
      t.timestamps
    end

    add_index :project_members, [:project_id, :user_id], unique: true
  end
end
