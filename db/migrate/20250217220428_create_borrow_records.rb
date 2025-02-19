class CreateBorrowRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :borrow_records do |t|
      t.references :book, null: false, foreign_key: true
      t.string :borrower_name, null: false
      t.datetime :borrowed_at
      t.datetime :returned_at

      t.timestamps
    end
  end
end
