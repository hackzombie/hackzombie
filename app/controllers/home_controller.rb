class HomeController < ApplicationController
  def index
    if current_user.nil?
       respond_to do |format|
          #format.html { "notloggedin" }
           format.html { redirect_to notloggedin_url }
          format.json { render :json => @platform }
        end
        notloggedin
    end
  end
  
  def notloggedin
    
    
  end
  
  
  

end
