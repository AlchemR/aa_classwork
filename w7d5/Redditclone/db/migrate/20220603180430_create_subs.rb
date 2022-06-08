class CreateSubs < ActiveRecord::Migration[6.1]
  def change
    create_table :subs do |t|
      t.string :title, null:false
      t.text :description, null:false
      t.integer :moderator_id, null:false
      t.timestamps
    end
    
  end
end