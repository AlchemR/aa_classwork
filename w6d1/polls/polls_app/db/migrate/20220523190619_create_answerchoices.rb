class CreateAnswerchoices < ActiveRecord::Migration[6.1]
  def change
    create_table :answerchoices do |t|
      t.integer :question_id, null: false
      t.integer :user_id, null: false
      t.string :choice, null: false
      t.timestamps
    end
  end
end
