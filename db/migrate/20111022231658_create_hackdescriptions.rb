class CreateHackdescriptions < ActiveRecord::Migration
  def change
    create_table :hackdescriptions do |t|
      t.text :description
      t.references :hack

      t.timestamps
    end
    add_index :hackdescriptions, :hack_id
  end
end
