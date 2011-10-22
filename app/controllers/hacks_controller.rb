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

    respond_to do |format|
      if @hack.save
        format.html { redirect_to @hack, :notice => 'Hack was successfully created.' }
        format.json { render :json => @hack, :status => :created, :location => @hack }
      else
        format.html { render :action => "new" }
        format.json { render :json => @hack.errors, :status => :unprocessable_entity }
      end
    end
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
