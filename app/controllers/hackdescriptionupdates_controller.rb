class HackdescriptionupdatesController < ApplicationController
 
  def index
    @hackdescriptionupdates = Hackdescriptionupdate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @hackdescriptionupdates }
    end
  end

  # GET /hackdescriptions/1
  # GET /hackdescriptions/1.json
  def show
    @hackdescriptionupdate = Hackdescriptionupdate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @hackdescriptionupdate }
    end
  end

  def new
    @hackdescriptionupdate = Hackdescriptionupdate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @hackdescriptionupdate }
    end
  end

  # GET /hackdescriptions/1/edit
  def edit
    @hackdescriptionupdate = Hackdescriptionupdate.find(params[:id])
  end

  # POST /hackdescriptions
  # POST /hackdescriptions.json
  def create
    @hackdescriptionupdate = Hackdescriptionupdate.new(params[:hackdescription])

    respond_to do |format|
      if @hackdescriptionupdate.save
        format.html { redirect_to @hackdescriptionupdate, :notice => 'Hackdescriptionupdate was successfully created.' }
        format.json { render :json => @hackdescriptionupdate, :status => :created, :location => @hackdescriptionupdate }
      else
        format.html { render :action => "new" }
        format.json { render :json => @hackdescriptionupdate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /hackdescriptions/1
  # PUT /hackdescriptions/1.json
  def update
    @hackdescriptionupdate = Hackdescriptionupdate.find(params[:id])

    respond_to do |format|
      if @hackdescriptionupdate.update_attributes(params[:hackdescription])
        format.html { redirect_to @hackdescriptionupdate, :notice => 'Hackdescription was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @hackdescriptionupdate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /hackdescriptions/1
  # DELETE /hackdescriptions/1.json
  def destroy
    @hackdescriptionupdate = Hackdescriptionupdate.find(params[:id])
    @hackdescriptionupdate.destroy

    respond_to do |format|
      format.html { redirect_to hackdescriptionupdates_url }
      format.json { head :ok }
    end
  end
end
