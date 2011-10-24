class HacksController < ApplicationController
  # GET /hacks
  # GET /hacks.json
  def index
    @hacks = Hack.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @hacks }
    end
  end

  # GET /hacks/1
  # GET /hacks/1.json
  def show
    @hack = Hack.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @hack }
    end
  end

  # GET /hacks/new
  # GET /hacks/new.json
  def new
    @hack = Hack.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @hack }
    end
  end

  # GET /hacks/1/edit
  def edit
    @hack = Hack.find(params[:id])
  end

  # POST /hacks
  # POST /hacks.json
  def create
    @hack = Hack.new(params[:hack])
    #logger.info "event_name: ======="
    event_name = params[:event_name]
    #logger.info "event_name: " + event_name unless event_name.nil?
    event = Event.find_by_name_caseinsensitive(event_name)
    if(event.nil?)
      logger.info "event not found, lets's create new one "
      event = Event.create()
      event.name = event_name
      event.eventdate = Time.new
      event.save
    end
    @hack.event = event
    respond_to do |format|
      if @hack.save
        emailaddresses = params[:hack_team_emails]
        logger.info "after new create hack, send team emails: " + emailaddresses
        invite_team_members(emailaddresses, @hack)
        format.html { redirect_to @hack, :notice => 'Hack was successfully created.' }
        format.json { render :json => @hack, :status => :created, :location => @hack }
      else
        format.html { render :action => "new" }
        format.json { render :json => @hack.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def invite_team_members(emailaddresses_text, hack)
    logger.info "invite_team_members, text = " + emailaddresses_text
    emailaddresses = InvitationsController.parse_users_by_emailaddress(emailaddresses_text)
    InvitationsController.send_invites(emailaddresses, hack)
  end

  # PUT /hacks/1
  # PUT /hacks/1.json
  def update
    @hack = Hack.find(params[:id])

    respond_to do |format|
      if @hack.update_attributes(params[:hack])
        format.html { redirect_to @hack, :notice => 'Hack was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @hack.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /hacks/1
  # DELETE /hacks/1.json
  def destroy
    @hack = Hack.find(params[:id])
    @hack.destroy

    respond_to do |format|
      format.html { redirect_to hacks_url }
      format.json { head :ok }
    end
  end
  
end
