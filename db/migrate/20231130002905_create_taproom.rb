class CreateTaproom < ActiveRecord::Migration[7.0]
  def change
    create_table :taprooms do |t|
      t.string :name
      t.string :address
      t.string :website
      t.string :phone_number
      t.integer :established
      t.integer :number_of_employees
      t.integer :serving_capacity
      t.boolean :offers_food

      t.timestamps
    end
  end
end
