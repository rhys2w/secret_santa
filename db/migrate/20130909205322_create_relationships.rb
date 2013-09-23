class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :gifter_id
      t.integer :giftee_id

      t.timestamps
    end
    add_index :relationships, :gifter_id
    add_index :relationships, :giftee_id
    add_index :relationships, [:gifter_id, :giftee_id], unique: true
  end
end
