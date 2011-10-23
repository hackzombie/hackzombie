class Event < ActiveRecord::Base
  has_many :hacks
  
  def self.find_by_name_caseinsensitive(event_name)
    company = Event.find(:first, :conditions => [ "lower(name) = ?", event_name.downcase])
  end
  
end
