class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      # create two columns create at  and update at
      t.timestamps null: false
    end
  end
end
