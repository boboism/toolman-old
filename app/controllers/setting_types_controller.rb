class SettingTypesController < ApplicationController
  # GET /setting_types
  # GET /setting_types.json
  def index
    @setting_types = SettingType.page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @setting_types }
    end
  end

  # GET /setting_types/1
  # GET /setting_types/1.json
  def show
    @setting_type = SettingType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @setting_type }
    end
  end

  # GET /setting_types/new
  # GET /setting_types/new.json
  def new
    @setting_type = SettingType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @setting_type }
    end
  end

  # GET /setting_types/1/edit
  def edit
    @setting_type = SettingType.find(params[:id])
  end

  # POST /setting_types
  # POST /setting_types.json
  def create
    @setting_type = SettingType.new(params[:setting_type])

    respond_to do |format|
      if @setting_type.save
        format.html { redirect_to @setting_type, notice: 'Setting type was successfully created.' }
        format.json { render json: @setting_type, status: :created, location: @setting_type }
      else
        format.html { render action: "new" }
        format.json { render json: @setting_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /setting_types/1
  # PUT /setting_types/1.json
  def update
    @setting_type = SettingType.find(params[:id])

    respond_to do |format|
      if @setting_type.update_attributes(params[:setting_type])
        format.html { redirect_to @setting_type, notice: 'Setting type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @setting_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /setting_types/1
  # DELETE /setting_types/1.json
  def destroy
    @setting_type = SettingType.find(params[:id])
    @setting_type.destroy

    respond_to do |format|
      format.html { redirect_to setting_types_url }
      format.json { head :no_content }
    end
  end
end
