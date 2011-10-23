class CreateHackplatformrelations < ActiveRecord::Migration
  def change
    create_table :hackplatformrelations do |t|
      t.references :platform
      t.references :hack

      t.timestamps
    end
    add_index :hackplatformrelations, :platform_id
    add_index :hackplatformrelations, :hack_id
  end
end
