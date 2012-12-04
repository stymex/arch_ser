class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :uid
      t.string :nickname
      t.string :email
      t.boolean :admin
      t.date :created

      t.timestamps
    end
  end
end
