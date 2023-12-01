class CreateBeer < ActiveRecord::Migration[7.0]
  def change
    create_table :beers do |t|
      t.string :name
      t.string :style
      t.boolean :medal_winner
      t.float :abv
      t.float :price

      t.timestamps
    end
  end
end

