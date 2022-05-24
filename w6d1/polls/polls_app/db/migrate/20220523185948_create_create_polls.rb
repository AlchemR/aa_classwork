class CreateCreatePolls < ActiveRecord::Migration[6.1]
  def change
    create_table :create_polls do |t|
      t.string :title, null: false
      t.timestamp :created_at, null: false
    end
  end
end
