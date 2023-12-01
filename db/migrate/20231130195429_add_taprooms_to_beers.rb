class AddTaproomsToBeers < ActiveRecord::Migration[7.0]
  def change
    add_reference :beers, :taproom, null: false, foreign_key: true
  end
end
