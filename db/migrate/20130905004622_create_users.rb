class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      #have to add the admin boulean here

      t.timestamps
    end
  end
end
