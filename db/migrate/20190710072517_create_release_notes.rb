class CreateReleaseNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :release_notes do |t|
      t.references :project, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.text :release_description, null: false
      t.float :release_number, null: false
      t.timestamps
    end

    add_index :release_notes, [:project_id, :release_number], unique: true
  end
end
