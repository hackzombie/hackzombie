class HomeController < ApplicationController
  def index
  end
  
  
  def testpost
    
    fbaccount = FacebookAccount.find(4)
    fbaccount.post("Hellow world from BeMyApp hackathon")
  end

end
