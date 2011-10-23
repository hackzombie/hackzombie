class CreateStatushackrelations < ActiveRecord::Migration
  def change
    create_table :statushackrelations do |t|
      t.references :status
      t.references :hack

      t.timestamps
    end
    add_index :statushackrelations, :status_id
    add_index :statushackrelations, :hack_id
  end
end
