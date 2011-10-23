class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :emailaddress
      t.references :hack

      t.timestamps
    end
    add_index :invitations, :hack_id
  end
end
