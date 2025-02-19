class CreateBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author
      t.string :isbn
      t.string :status

      t.timestamps
    end
  end
end
