class Answers < ActiveRecord::Migration
  def up
    create_table :answers do |t|
      t.integer :question_id
      t.string :content
      t.integer :votes

      t.timestamps
    end
  end

  def down
  end
end
