class CreateSeats < ActiveRecord::Migration[6.1]
  def change
    create_table :seats do |t|
      t.integer :snum
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :program, null: false, foreign_key: true

      t.timestamps
    end
  end
end
