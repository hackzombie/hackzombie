class FacebookAccount < ActiveRecord::Base

  # Stubbed out! Does no (good) error checking!  

  # Get these from facebook!
  FACEBOOK_CLIENT_ID = '125774377529637'
  FACEBOOK_CLIENT_SECRET = 'a26443b2b8cd9ebb0a01daf9b4e78c15'

  def authorize_url(callback_url = '')
    if self.oauth_authorize_url.blank?
      self.oauth_authorize_url = "https://graph.facebook.com/oauth/authorize?client_id=#{FACEBOOK_CLIENT_ID}&redirect_uri=#{callback_url}&scope=offline_access,publish_stream"
      self.save!
    end
    self.oauth_authorize_url
  end
  
  def validate_oauth_token(oauth_verifier, callback_url = '')
    logger.info "================== oauth_verifier: " + oauth_verifier + ", callback_url : " + callback_url
    paramsFB = Hash.new("go fish")
    paramsFB[:client_id] = FACEBOOK_CLIENT_ID
    paramsFB[:redirect_uri] = callback_url.html_safe
    paramsFB[:client_secret] = FACEBOOK_CLIENT_SECRET
    paramsFB[:code] = oauth_verifier.html_safe
    logger.info "params: " + paramsFB.to_s
    
    logger.info "redirect_uri parameter: " + paramsFB[:redirect_uri]
    response = nil
    begin
      logger.info "about to do request"
      
      #query_string = paramsFB.collect { |k,v| "#{k}=#{CGI::escape(v)}" }.join('&')
      query_string = "client_id=" + FACEBOOK_CLIENT_ID
      query_string += "&redirect_uri=" + callback_url.html_safe
      query_string += "&client_secret=" + FACEBOOK_CLIENT_SECRET
      query_string += "&code=" + oauth_verifier.html_safe
      logger.info "about to do request 22"
      url = "https://graph.facebook.com/oauth/access_token"
      logger.info "about to do request 33"
      logger.info "query_string = " + query_string
      response = RestClient.get "#{url}?#{query_string}"
      
      
      #response = RestClient.get 'https://graph.facebook.com/oauth/access_token',  paramsFB
      
      #response = RestClient.get 'https://graph.facebook.com/oauth/access_token',:nested => { :param1 => 'one' }
      logger.info "afterrrr to do request"
      logger.info "aaaaaa ++++++++ res.code ==> " + response.code.to_s
      logger.info "res.headers[:content_type] " + response.headers[:content_type]
    rescue => e
      logger.info "++++++++ exception... "
      logger.info "++++++++ rescue ==> " + e.response
      logger.info "++++++++ res.code ==> " + response.code.to_s
      logger.info "res.headers[:content_type] " + response.headers[:content_type]
    end
   # response = RestClient.get 'https://graph.facebook.com/oauth/access_token', :params => {
  #                 :client_id => FACEBOOK_CLIENT_ID,
   #                :redirect_uri => callback_url.html_safe,
   #                :client_secret => FACEBOOK_CLIENT_SECRET,
  #                 :code => oauth_verifier.html_safe
   #             }
    pair = response.body.split("&")[0].split("=")
    if (pair[0] == "access_token")
      self.access_token = pair[1]
      response = RestClient.get 'https://graph.facebook.com/me', :params => { :access_token => self.access_token }
      self.stream_url = JSON.parse(response.body)["link"]
      self.active = true
    else 
      self.errors.add(:oauth_verifier, "Invalid token, unable to connect to facebook: #{pair[1]}")
      self.active = false
    end
    self.save!
  end
  
  def post(message)
    RestClient.post 'https://graph.facebook.com/me/feed', { :access_token => self.access_token, :message => message }
  end

end