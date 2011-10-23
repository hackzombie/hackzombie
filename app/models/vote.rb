class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :hack
  
  def self.find_by_hack_and_user(hack_id, user_id)
    vate = Vote.find(:first, :conditions => [ "hack_id = ? and user_id = ?", hack_id, user_id])
  end
end
