class StatushackrelationsController < ApplicationController
  # GET /statushackrelations
  # GET /statushackrelations.json
  def index
    @statushackrelations = Statushackrelation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @statushackrelations }
    end
  end

  # GET /statushackrelations/1
  # GET /statushackrelations/1.json
  def show
    @statushackrelation = Statushackrelation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @statushackrelation }
    end
  end

  # GET /statushackrelations/new
  # GET /statushackrelations/new.json
  def new
    @statushackrelation = Statushackrelation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @statushackrelation }
    end
  end

  # GET /statushackrelations/1/edit
  def edit
    @statushackrelation = Statushackrelation.find(params[:id])
  end

  # POST /statushackrelations
  # POST /statushackrelations.json
  def create
    @statushackrelation = Statushackrelation.new(params[:statushackrelation])

    respond_to do |format|
      if @statushackrelation.save
        format.html { redirect_to @statushackrelation, :notice => 'Statushackrelation was successfully created.' }
        format.json { render :json => @statushackrelation, :status => :created, :location => @statushackrelation }
      else
        format.html { render :action => "new" }
        format.json { render :json => @statushackrelation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /statushackrelations/1
  # PUT /statushackrelations/1.json
  def update
    @statushackrelation = Statushackrelation.find(params[:id])

    respond_to do |format|
      if @statushackrelation.update_attributes(params[:statushackrelation])
        format.html { redirect_to @statushackrelation, :notice => 'Statushackrelation was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @statushackrelation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /statushackrelations/1
  # DELETE /statushackrelations/1.json
  def destroy
    @statushackrelation = Statushackrelation.find(params[:id])
    @statushackrelation.destroy

    respond_to do |format|
      format.html { redirect_to statushackrelations_url }
      format.json { head :ok }
    end
  end
end
