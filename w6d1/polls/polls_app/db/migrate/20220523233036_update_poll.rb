class UpdatePoll < ActiveRecord::Migration[6.1]
  def change
  add_column :polls, :author_id, :integer, null:false
  end
end
