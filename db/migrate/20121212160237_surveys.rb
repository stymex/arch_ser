class Surveys < ActiveRecord::Migration
  def up
    create_table :surveys do |t|
      t.string :name

      t.timestamps
    end
  end

  def down
  end
end
