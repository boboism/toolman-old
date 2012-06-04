class SharpenDevicesController < ApplicationController
  # GET /sharpen_devices
  # GET /sharpen_devices.json
  def index
    @sharpen_devices = SharpenDevice.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sharpen_devices }
    end
  end

  # GET /sharpen_devices/1
  # GET /sharpen_devices/1.json
  def show
    @sharpen_device = SharpenDevice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sharpen_device }
    end
  end

  # GET /sharpen_devices/new
  # GET /sharpen_devices/new.json
  def new
    @sharpen_device = SharpenDevice.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sharpen_device }
    end
  end

  # GET /sharpen_devices/1/edit
  def edit
    @sharpen_device = SharpenDevice.find(params[:id])
  end

  # POST /sharpen_devices
  # POST /sharpen_devices.json
  def create
    @sharpen_device = SharpenDevice.new(params[:sharpen_device])

    respond_to do |format|
      if @sharpen_device.save
        format.html { redirect_to @sharpen_device, notice: 'Sharpen device was successfully created.' }
        format.json { render json: @sharpen_device, status: :created, location: @sharpen_device }
      else
        format.html { render action: "new" }
        format.json { render json: @sharpen_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sharpen_devices/1
  # PUT /sharpen_devices/1.json
  def update
    @sharpen_device = SharpenDevice.find(params[:id])

    respond_to do |format|
      if @sharpen_device.update_attributes(params[:sharpen_device])
        format.html { redirect_to @sharpen_device, notice: 'Sharpen device was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sharpen_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sharpen_devices/1
  # DELETE /sharpen_devices/1.json
  def destroy
    @sharpen_device = SharpenDevice.find(params[:id])
    @sharpen_device.destroy

    respond_to do |format|
      format.html { redirect_to sharpen_devices_url }
      format.json { head :no_content }
    end
  end
end
