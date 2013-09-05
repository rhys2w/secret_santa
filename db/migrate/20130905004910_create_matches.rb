class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :gifter
      t.integer :giftee

      t.timestamps
    end
  end
end
