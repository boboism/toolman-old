class FacilityCodesController < ApplicationController
  # GET /facility_codes
  # GET /facility_codes.json
  def index
    @facility_codes = FacilityCode.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @facility_codes }
    end
  end

  # GET /facility_codes/1
  # GET /facility_codes/1.json
  def show
    @facility_code = FacilityCode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @facility_code }
    end
  end

  # GET /facility_codes/new
  # GET /facility_codes/new.json
  def new
    @facility_code = FacilityCode.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @facility_code }
    end
  end

  # GET /facility_codes/1/edit
  def edit
    @facility_code = FacilityCode.find(params[:id])
  end

  # POST /facility_codes
  # POST /facility_codes.json
  def create
    @facility_code = FacilityCode.new(params[:facility_code])

    respond_to do |format|
      if @facility_code.save
        format.html { redirect_to @facility_code, notice: 'Facility code was successfully created.' }
        format.json { render json: @facility_code, status: :created, location: @facility_code }
      else
        format.html { render action: "new" }
        format.json { render json: @facility_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /facility_codes/1
  # PUT /facility_codes/1.json
  def update
    @facility_code = FacilityCode.find(params[:id])

    respond_to do |format|
      if @facility_code.update_attributes(params[:facility_code])
        format.html { redirect_to @facility_code, notice: 'Facility code was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @facility_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facility_codes/1
  # DELETE /facility_codes/1.json
  def destroy
    @facility_code = FacilityCode.find(params[:id])
    @facility_code.destroy

    respond_to do |format|
      format.html { redirect_to facility_codes_url }
      format.json { head :no_content }
    end
  end
end
