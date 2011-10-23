class AddcolumnsHack < ActiveRecord::Migration
  def up
    add_column :hacks, :description, :text
    add_column :hacks, :media_url, :string
    add_column :hacks, :info_url, :string
    add_column :hacks, :votes, :integer
    add_column :hacks, :status_id, :integer    
    
  end

  def down
    remove_column :hacks, :description
    remove_column :hacks, :media_url
    remove_column :hacks, :info_url
    remove_column :hacks, :votes
    remove_column :hacks, :status_id
  end
end
