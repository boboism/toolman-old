class FacilityTypesController < ApplicationController
  # GET /facility_types
  # GET /facility_types.json
  def index
    @facility_types = FacilityType.page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @facility_types }
    end
  end

  # GET /facility_types/1
  # GET /facility_types/1.json
  def show
    @facility_type = FacilityType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @facility_type }
    end
  end

  # GET /facility_types/new
  # GET /facility_types/new.json
  def new
    @facility_type = FacilityType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @facility_type }
    end
  end

  # GET /facility_types/1/edit
  def edit
    @facility_type = FacilityType.find(params[:id])
  end

  # POST /facility_types
  # POST /facility_types.json
  def create
    @facility_type = FacilityType.new(params[:facility_type])

    respond_to do |format|
      if @facility_type.save
        format.html { redirect_to @facility_type, notice: 'Facility type was successfully created.' }
        format.json { render json: @facility_type, status: :created, location: @facility_type }
      else
        format.html { render action: "new" }
        format.json { render json: @facility_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /facility_types/1
  # PUT /facility_types/1.json
  def update
    @facility_type = FacilityType.find(params[:id])

    respond_to do |format|
      if @facility_type.update_attributes(params[:facility_type])
        format.html { redirect_to @facility_type, notice: 'Facility type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @facility_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facility_types/1
  # DELETE /facility_types/1.json
  def destroy
    @facility_type = FacilityType.find(params[:id])
    @facility_type.destroy

    respond_to do |format|
      format.html { redirect_to facility_types_url }
      format.json { head :no_content }
    end
  end
end
