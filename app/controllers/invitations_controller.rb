class InvitationsController < ApplicationController
  # GET /invitations
  # GET /invitations.json
  def index
    @invitations = Invitation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @invitations }
    end
  end

  # GET /invitations/1
  # GET /invitations/1.json
  def show
    @invitation = Invitation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @invitation }
    end
  end

  # GET /invitations/new
  # GET /invitations/new.json
  def new
    @invitation = Invitation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @invitation }
    end
  end
  
  def collectionform
    respond_to do |format|
      format.html # new.html.erb
    end
  end
  
  def sendinvites
    logger.info "sendinvites!!!!"
    allemailaddresses = params[:emailadddresses]
    hack_id = params[:hack_id]
    parsed_emailaddresses = parse_users_by_emailaddress(allemailaddresses)
    hack = Hack.find(hack_id)
    parsed_emailaddresses.each do|emailaddress|
      invitation = Invitation.new
      invitation.emailaddress = emailaddress
      o =  [('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten;  
      code  =  (0..50).map{ o[rand(o.length)]  }.join;
      invitation.code = code
      invitation.hack = hack
      invitation.save
      Notifier.invite_for_hack(emailaddress, hack.name, code).deliver
    end
    respond_to do |format|
      format.html { redirect_to invitations_url }
      format.json { head :ok }
    end
  end
  
  def parse_users_by_emailaddress(allemailaddresses)
    logger.info "parse_users_by_emailaddress, allemailaddresses " + allemailaddresses unless allemailaddresses.nil?
    newusersemailaddresses = []
    if !allemailaddresses.nil? && allemailaddresses.length > 0
      emailaddresses = allemailaddresses.split(',')
      emailaddresses.each do|emailaddress|
        trimmed_email = emailaddress.strip
        if !trimmed_email.nil? && trimmed_email.length > 0
          newusersemailaddresses << trimmed_email
        end
      end
    end
    newusersemailaddresses
  end
  
  def accept
    invitecode = params[:invitecode]
    logger.info "invitecode: " + invitecode
  end

  # GET /invitations/1/edit
  def edit
    @invitation = Invitation.find(params[:id])
  end

  # POST /invitations
  # POST /invitations.json
  def create
    @invitation = Invitation.new(params[:invitation])

    respond_to do |format|
      if @invitation.save
        format.html { redirect_to @invitation, :notice => 'Invitation was successfully created.' }
        format.json { render :json => @invitation, :status => :created, :location => @invitation }
      else
        format.html { render :action => "new" }
        format.json { render :json => @invitation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /invitations/1
  # PUT /invitations/1.json
  def update
    @invitation = Invitation.find(params[:id])

    respond_to do |format|
      if @invitation.update_attributes(params[:invitation])
        format.html { redirect_to @invitation, :notice => 'Invitation was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @invitation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /invitations/1
  # DELETE /invitations/1.json
  def destroy
    @invitation = Invitation.find(params[:id])
    @invitation.destroy

    respond_to do |format|
      format.html { redirect_to invitations_url }
      format.json { head :ok }
    end
  end
end
