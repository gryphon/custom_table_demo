class CreateGenres < ActiveRecord::Migration[7.2]
  def change
    create_table :genres do |t|
      t.string :name
      t.references :parent

      t.timestamps
    end
  end
end
