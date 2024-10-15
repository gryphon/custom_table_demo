class AddAuthorToBook < ActiveRecord::Migration[7.2]
  def change
    add_reference :books, :author
  end
end
