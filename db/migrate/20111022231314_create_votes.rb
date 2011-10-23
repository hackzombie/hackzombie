class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user
      t.references :hack

      t.timestamps
    end
    add_index :votes, :user_id
    add_index :votes, :hack_id
  end
end
