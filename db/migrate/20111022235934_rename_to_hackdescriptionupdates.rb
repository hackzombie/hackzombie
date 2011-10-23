class RenameToHackdescriptionupdates < ActiveRecord::Migration
  def up
    rename_table :hackdescriptions, :hackdescriptionupdates 
  end

  def down
    rename_table :hackdescriptionupdates, :hackdescriptions 
  end
end
