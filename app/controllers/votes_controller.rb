class VotesController < ApplicationController
  # GET /votes
  # GET /votes.json
  def index
    @votes = Vote.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @votes }
    end
  end

  # GET /votes/1
  # GET /votes/1.json
  def show
    @vote = Vote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @vote }
    end
  end

  # GET /votes/new
  # GET /votes/new.json
  def new
    @vote = Vote.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @vote }
    end
  end

  # GET /votes/1/edit
  def edit
    @vote = Vote.find(params[:id])
  end

  # POST /votes
  # POST /votes.json
  def create
    @vote = Vote.new(params[:vote])
    @vote.user = current_user
    #votedAlreadyVoted = Vote.find_by_user_id(current_user.id)
    votedAlreadyVoted = Vote.find_by_hack_and_user(@vote.hack.id, current_user.id)
    dovote = true
    if votedAlreadyVoted.nil?
      logger.info "not already voted"
      dovote = false 
      if @vote.hack.votes.nil?
        @vote.hack.votes = 1 
      else
        @vote.hack.votes += 1 
      end
      @vote.hack.save
    else
      logger.info "already voted!!!"
    end
    respond_to do |format|
      if dovote || @vote.save
        format.html do |format| 
          if request.xhr?
            render :json => @vote.hack.votes #:partial => "vote", :locals => { :vote => @vote, :hack => @vote.hack }
          else
            redirect_to @vote, :notice => 'Vote was successfully created.'
          end
        end
        
        format.json { render :json => @vote, :status => :created, :location => @vote }
      else
        format.html do |format| 
          if request.xhr?
            render :json => @vote.hack.votes   #:partial => "vote", :locals => { :vote => @vote, :hack => @vote.hack }
          else
            render :action => "new"
          end
        end
        format.json { render :json => @vote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /votes/1
  # PUT /votes/1.json
  def update
    @vote = Vote.find(params[:id])

    respond_to do |format|
      if @vote.update_attributes(params[:vote])
        format.html { redirect_to @vote, :notice => 'Vote was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @vote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy

    respond_to do |format|
      format.html { redirect_to votes_url }
      format.json { head :ok }
    end
  end
end
