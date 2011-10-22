class FacebookAccountsController < ApplicationController

  # Stubbed out! Does no (good) error checking!

  def new
    facebook_account = FacebookAccount.create()
    redirect_to(facebook_account.authorize_url(facebook_callback_url(:id => facebook_account.id)))
  end

  def callback
    if params[:error_reason] && !params[:error_reason].empty?
      # We have a problem!
      redirect_to(:root, :notice => "Unable to activate facebook: #{params[:error_reason]}")
    elsif params[:code] && !params[:code].empty?
      # This is the callback, we have an id and an access code
      facebook_account = FacebookAccount.find(params[:id])
      facebook_account.validate_oauth_token(params[:code], facebook_callback_url(:id => facebook_account.id))
      redirect_to(:root, :notice => 'Facebook account activated!')
    end
  end

end