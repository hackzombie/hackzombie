class Notifier < ActionMailer::Base
  default :from => "Hack Yeahhhh <nohack@hackyeah.net>",
    :return_path => "Hack Yeahhhh <nohack@hackyeah.net>"
    
  def invite_for_hack(emailaddress, hackname, code) 
    logger.info "invite_for_hack, code = " + code
    @invitelink = accepthackinvite_url(code)
    @hackname = hackname
    mail(:to =>emailaddress,
    #mail(:to => "dirk.dekok@xs4all.nl",
         :subject => "Invited to join a HackYeah team!"
    ) do |format|
      format.text
      format.html
    end
  end
  
end
