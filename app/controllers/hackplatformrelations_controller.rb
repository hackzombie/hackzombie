class HackplatformrelationsController < ApplicationController
  # GET /hackplatformrelations
  # GET /hackplatformrelations.json
  def index
    @hackplatformrelations = Hackplatformrelation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @hackplatformrelations }
    end
  end

  # GET /hackplatformrelations/1
  # GET /hackplatformrelations/1.json
  def show
    @hackplatformrelation = Hackplatformrelation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @hackplatformrelation }
    end
  end

  # GET /hackplatformrelations/new
  # GET /hackplatformrelations/new.json
  def new
    @hackplatformrelation = Hackplatformrelation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @hackplatformrelation }
    end
  end

  # GET /hackplatformrelations/1/edit
  def edit
    @hackplatformrelation = Hackplatformrelation.find(params[:id])
  end

  # POST /hackplatformrelations
  # POST /hackplatformrelations.json
  def create
    @hackplatformrelation = Hackplatformrelation.new(params[:hackplatformrelation])

    respond_to do |format|
      if @hackplatformrelation.save
        format.html { redirect_to @hackplatformrelation, :notice => 'Hackplatformrelation was successfully created.' }
        format.json { render :json => @hackplatformrelation, :status => :created, :location => @hackplatformrelation }
      else
        format.html { render :action => "new" }
        format.json { render :json => @hackplatformrelation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /hackplatformrelations/1
  # PUT /hackplatformrelations/1.json
  def update
    @hackplatformrelation = Hackplatformrelation.find(params[:id])

    respond_to do |format|
      if @hackplatformrelation.update_attributes(params[:hackplatformrelation])
        format.html { redirect_to @hackplatformrelation, :notice => 'Hackplatformrelation was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @hackplatformrelation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /hackplatformrelations/1
  # DELETE /hackplatformrelations/1.json
  def destroy
    @hackplatformrelation = Hackplatformrelation.find(params[:id])
    @hackplatformrelation.destroy

    respond_to do |format|
      format.html { redirect_to hackplatformrelations_url }
      format.json { head :ok }
    end
  end
end
