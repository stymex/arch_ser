class Questions < ActiveRecord::Migration
  def up
    create_table :questions do |t|
      t.integer :survey_id
      t.text :content

      t.timestamps
    end
  end

  def down
  end
end
