class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :gifter_id
      t.integer :giftee_id

      t.timestamps
    end
  end
end
