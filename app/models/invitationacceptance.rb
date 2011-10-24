class Invitationacceptance
  
  extend ActiveModel::Naming 
 	include ActiveModel::Validations
 	include ActiveModel::Conversion
  
  def persisted?
	  idd = @id
	  #Rails.logger.info "persisted? id = " + idd.to_s
    idd > 0
  end
  
  def new_record?
    idd = @id
    #Rails.logger.info "new record?  idd = " + idd.to_s
    idd == 0
  end
	
	# testers is an array of ids, newtesters a string of comma separated email addresses
	attr_accessor :id, :code, :hack_id, :hack,:role, :user
	
	def initialize(attributes = {})
    Rails.logger.info "initialize, setting attributes and setting InvitationAcceptance id"
    # @attributes = attributes
    attributes.each do |name, value|  
      send("#{name}=", value)  
    end
    @id = 0
  end
  
  def update_attributes(attributes = {})
    Rails.logger.info "update_attributes, setting attributes"
    if !attributes.nil? && !attributes.empty?
      attributes.each do |name, value|  
        send("#{name}=", value)  
      end
    end
  end
  
end