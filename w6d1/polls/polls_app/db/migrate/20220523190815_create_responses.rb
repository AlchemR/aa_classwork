class CreateResponses < ActiveRecord::Migration[6.1]
  def change
    create_table :responses do |t|
      t.integer :choice_id
      t.integer :user_id
      t.timestamp :created_at, null:false
    end
    rename_table :create_polls, :polls
  end
end
