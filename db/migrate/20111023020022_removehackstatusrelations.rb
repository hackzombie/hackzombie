class Removehackstatusrelations < ActiveRecord::Migration
  def up
    drop_table :statushackrelations
    add_column :hacks, :status_id, :integer
  end

  def down
    remove_column :hacks, :status_id
  end
end
