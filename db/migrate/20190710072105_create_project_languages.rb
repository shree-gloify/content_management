class CreateProjectLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :project_languages do |t|
      t.references :project, foreign_key: true, null: false
      t.string :language, null: false
      t.timestamps
    end
  end
end
