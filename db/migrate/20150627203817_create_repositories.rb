class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.integer :github_id, null: false
      t.string :name, null: false
      t.string :full_name, null: false
      t.boolean :private, default: true
      t.boolean :fork, default: false
      t.string :homepage
      t.string :language
      t.datetime :last_fetched_at

      t.timestamps null: false
    end
  end
end
