class Notifier < ActionMailer::Base
  default :from => "Hack Yeahhhh <nohack@hackyeah.net>",
    :return_path => "Hack Yeahhhh <nohack@hackyeah.net>"
    
  def invite_for_hack(emailaddress, hackname, code) 
    logger.info "invite_for_hack, code = " + code
    @invitelink = accepthackinvite_url(code)
    @hackname = hackname
    mail(:to =>emailaddress,
         :subject => "Invited to join the" +hackname + " HackYeah team!"
    ) do |format|
      format.text
      format.html
    end
  end
  
end
