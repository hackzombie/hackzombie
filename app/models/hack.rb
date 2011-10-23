class Hack < ActiveRecord::Base
  belongs_to :status
  belongs_to :event
  
 # has_many :statushackrelations
#  has_many :statuses, :through => :statushackrelations 
  
  has_many :hackplatformrelations
  has_many :platforms, :through => :hackplatformrelations

  has_many :hackdescriptionupdates

  has_many :comments

  def short_age
    # TODO(scotty): Implement this.
    "5d"
  end
  
  def platform_ids=(platform_ids)
    logger.info "platform_ids : " + platform_ids.to_s
    hackplatformrelations.each do |hackplatformrelation|
      # destroying the item you are enumerating over usually isn't a good idea.
      # So this may not work:
      hackplatformrelation.destroy unless platform_ids.include? hackplatformrelation.platform_id
    end
    platform_ids.each do |platform_id|
      self.hackplatformrelations.create(:platform_id => platform_id) 
    end
  end
  
end
