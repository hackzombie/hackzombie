class CreateUserhackrelations < ActiveRecord::Migration
  def change
    create_table :userhackrelations do |t|
      t.references :user
      t.references :hack
      t.string :role

      t.timestamps
    end
    add_index :userhackrelations, :user_id
    add_index :userhackrelations, :hack_id
  end
end
