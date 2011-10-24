class UserhackrelationsController < ApplicationController
  # GET /userhackrelations
  # GET /userhackrelations.json
  def index
    @userhackrelations = Userhackrelation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @userhackrelations }
    end
  end

  # GET /userhackrelations/1
  # GET /userhackrelations/1.json
  def show
    @userhackrelation = Userhackrelation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @userhackrelation }
    end
  end

  # GET /userhackrelations/new
  # GET /userhackrelations/new.json
  def new
    @userhackrelation = Userhackrelation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @userhackrelation }
    end
  end

  # GET /userhackrelations/1/edit
  def edit
    @userhackrelation = Userhackrelation.find(params[:id])
  end

  # POST /userhackrelations
  # POST /userhackrelations.json
  def create
    @userhackrelation = Userhackrelation.new(params[:userhackrelation])

    respond_to do |format|
      if @userhackrelation.save
        format.html { redirect_to @userhackrelation, :notice => 'Userhackrelation was successfully created.' }
        format.json { render :json => @userhackrelation, :status => :created, :location => @userhackrelation }
      else
        format.html { render :action => "new" }
        format.json { render :json => @userhackrelation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /userhackrelations/1
  # PUT /userhackrelations/1.json
  def update
    @userhackrelation = Userhackrelation.find(params[:id])

    respond_to do |format|
      if @userhackrelation.update_attributes(params[:userhackrelation])
        format.html { redirect_to @userhackrelation, :notice => 'Userhackrelation was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @userhackrelation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /userhackrelations/1
  # DELETE /userhackrelations/1.json
  def destroy
    @userhackrelation = Userhackrelation.find(params[:id])
    @userhackrelation.destroy

    respond_to do |format|
      format.html { redirect_to userhackrelations_url }
      format.json { head :ok }
    end
  end
end
