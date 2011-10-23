class AddCodeInvitations2 < ActiveRecord::Migration
  def up
    add_column :invitations, :code, :string
  end

  def down
    remove_column :invitations, :code
  end
end
