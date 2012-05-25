class SeatController < ApplicationController
  def notify
    @checkin = Checkin.find(params[:id])
    @result = "fail"
    app = C2dm::App.find_by_application_id("com.cse694")
    device = app.devices.find_by_registration_id(@checkin.device_reg)
    
    if device
      @result = "success"
      randstr = (0...8).map{65.+(rand(25)).chr}.join
      push = device.notifications.new(:data => {:message => "Your seat is ready", :restaurant_id => @checkin.restaurant_id}, :delay_while_idle => false, :collapse_key => randstr)
      app.deliver_notification(push)
      @checkin.destroy
    end
    
    respond_to do |format|
      format.html # notify.html.erb
      format.json # notify.json.erb
    end
  end
end
