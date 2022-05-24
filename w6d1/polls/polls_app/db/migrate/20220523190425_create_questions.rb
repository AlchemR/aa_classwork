class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.text :body, null:false
      t.timestamp :created_at, null:false
    end
  end
end
