class CreateExchanges < ActiveRecord::Migration
  def change
    create_table :exchanges do |t|
      t.string :exchange_name
      t.datetime :due_date
      t.string :price

      t.timestamps
    end
  end
end
