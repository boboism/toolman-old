class ScrapTypesController < ApplicationController
  # GET /scrap_types
  # GET /scrap_types.json
  def index
    @scrap_types = ScrapType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @scrap_types }
    end
  end

  # GET /scrap_types/1
  # GET /scrap_types/1.json
  def show
    @scrap_type = ScrapType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @scrap_type }
    end
  end

  # GET /scrap_types/new
  # GET /scrap_types/new.json
  def new
    @scrap_type = ScrapType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @scrap_type }
    end
  end

  # GET /scrap_types/1/edit
  def edit
    @scrap_type = ScrapType.find(params[:id])
  end

  # POST /scrap_types
  # POST /scrap_types.json
  def create
    @scrap_type = ScrapType.new(params[:scrap_type])

    respond_to do |format|
      if @scrap_type.save
        format.html { redirect_to @scrap_type, notice: 'Scrap type was successfully created.' }
        format.json { render json: @scrap_type, status: :created, location: @scrap_type }
      else
        format.html { render action: "new" }
        format.json { render json: @scrap_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /scrap_types/1
  # PUT /scrap_types/1.json
  def update
    @scrap_type = ScrapType.find(params[:id])

    respond_to do |format|
      if @scrap_type.update_attributes(params[:scrap_type])
        format.html { redirect_to @scrap_type, notice: 'Scrap type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @scrap_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scrap_types/1
  # DELETE /scrap_types/1.json
  def destroy
    @scrap_type = ScrapType.find(params[:id])
    @scrap_type.destroy

    respond_to do |format|
      format.html { redirect_to scrap_types_url }
      format.json { head :no_content }
    end
  end
end
