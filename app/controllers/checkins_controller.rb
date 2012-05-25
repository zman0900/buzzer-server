class CheckinsController < ApplicationController
  # GET /checkins
  # GET /checkins.json
  def index
    @checkins = Checkin.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @checkins }
    end
  end

  # GET /checkins/1
  # GET /checkins/1.json
  def show
    @checkin = Checkin.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @checkin }
    end
  end

  # GET /checkins/new
  # GET /checkins/new.json
  def new
    @checkin = Checkin.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @checkin }
    end
  end

  # GET /checkins/1/edit
  def edit
    @checkin = Checkin.find(params[:id])
  end

  # POST /checkins
  # POST /checkins.json
  def create
    @checkin = Checkin.new(params[:checkin])

    respond_to do |format|
      if @checkin.save
        app = C2dm::App.find_by_application_id("com.cse694")
        device = app.devices.find_by_registration_id(@checkin.device_reg)
        if !device
          device = app.devices.new(:registration_id => @checkin.device_reg)
          device.save
        end
      
        format.html { redirect_to @checkin, :notice => 'Checkin was successfully created.' }
        format.json { render :json => @checkin, :status => :created, :location => @checkin }
      else
        format.html { render :action => "new" }
        format.json { render :json => @checkin.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /checkins/1
  # PUT /checkins/1.json
  def update
    @checkin = Checkin.find(params[:id])

    respond_to do |format|
      if @checkin.update_attributes(params[:checkin])
        format.html { redirect_to @checkin, :notice => 'Checkin was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @checkin.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /checkins/1
  # DELETE /checkins/1.json
  def destroy
    @checkin = Checkin.find(params[:id])
    if Checkin.find_all_by_device_reg(@checkin.device_reg).count == 1
      app = C2dm::App.find_by_application_id("com.cse694")
      device = app.devices.find_by_registration_id(@checkin.device_reg)
      device.destroy
    end
    @checkin.destroy

    respond_to do |format|
      format.html { redirect_to checkins_url }
      format.json { head :ok }
    end
  end
end
