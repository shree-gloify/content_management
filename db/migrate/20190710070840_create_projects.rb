class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.references :user, foreign_key: true, null: false, index: true
      t.string :project_name, null: false
      t.text :project_description
      t.string :slug, null: false
      t.timestamps
    end
  end
end
