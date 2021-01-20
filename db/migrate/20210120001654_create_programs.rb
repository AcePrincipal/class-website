class CreatePrograms < ActiveRecord::Migration[6.1]
  def change
    create_table :programs do |t|
      t.string :title
      t.text :description
      t.integer :num_of_seats
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
