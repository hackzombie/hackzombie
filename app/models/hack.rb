class Hack < ActiveRecord::Base
  belongs_to :status
  belongs_to :event
  
  has_many :statushackrelations
  has_many :statuses, :through => :statushackrelations 
  
  has_many :hackplatformrelations
  has_many :platforms, :through => :hackplatformrelations
end
