class AddEventidHack < ActiveRecord::Migration
  def up
    add_column :hacks, :event_id, :integer  
  end

  def down
    remove_column :hacks, :event_id  
  end
end
