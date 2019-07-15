class CreateReleaseComments < ActiveRecord::Migration[5.2]
  def change
    create_table :release_comments do |t|
      t.references :release_note, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.text :description, null: false
      t.timestamps
    end
  end
end
