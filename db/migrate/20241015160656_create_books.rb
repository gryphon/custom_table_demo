class CreateBooks < ActiveRecord::Migration[7.2]
  def change
    create_table :books do |t|
      t.string :name
      t.references :genre, null: false, foreign_key: true
      t.date :released_at
      t.integer :status
      t.boolean :featured
      t.integer :pages

      t.timestamps
    end
  end
end
