class SettingDevicesController < ApplicationController
  # GET /setting_devices
  # GET /setting_devices.json
  def index
    @setting_devices = SettingDevice.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @setting_devices }
    end
  end

  # GET /setting_devices/1
  # GET /setting_devices/1.json
  def show
    @setting_device = SettingDevice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @setting_device }
    end
  end

  # GET /setting_devices/new
  # GET /setting_devices/new.json
  def new
    @setting_device = SettingDevice.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @setting_device }
    end
  end

  # GET /setting_devices/1/edit
  def edit
    @setting_device = SettingDevice.find(params[:id])
  end

  # POST /setting_devices
  # POST /setting_devices.json
  def create
    @setting_device = SettingDevice.new(params[:setting_device])

    respond_to do |format|
      if @setting_device.save
        format.html { redirect_to @setting_device, notice: 'Setting device was successfully created.' }
        format.json { render json: @setting_device, status: :created, location: @setting_device }
      else
        format.html { render action: "new" }
        format.json { render json: @setting_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /setting_devices/1
  # PUT /setting_devices/1.json
  def update
    @setting_device = SettingDevice.find(params[:id])

    respond_to do |format|
      if @setting_device.update_attributes(params[:setting_device])
        format.html { redirect_to @setting_device, notice: 'Setting device was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @setting_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /setting_devices/1
  # DELETE /setting_devices/1.json
  def destroy
    @setting_device = SettingDevice.find(params[:id])
    @setting_device.destroy

    respond_to do |format|
      format.html { redirect_to setting_devices_url }
      format.json { head :no_content }
    end
  end
end
