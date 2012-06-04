class QualityCategoriesController < ApplicationController
  # GET /quality_categories
  # GET /quality_categories.json
  def index
    @quality_categories = QualityCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @quality_categories }
    end
  end

  # GET /quality_categories/1
  # GET /quality_categories/1.json
  def show
    @quality_category = QualityCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @quality_category }
    end
  end

  # GET /quality_categories/new
  # GET /quality_categories/new.json
  def new
    @quality_category = QualityCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @quality_category }
    end
  end

  # GET /quality_categories/1/edit
  def edit
    @quality_category = QualityCategory.find(params[:id])
  end

  # POST /quality_categories
  # POST /quality_categories.json
  def create
    @quality_category = QualityCategory.new(params[:quality_category])

    respond_to do |format|
      if @quality_category.save
        format.html { redirect_to @quality_category, notice: 'Quality category was successfully created.' }
        format.json { render json: @quality_category, status: :created, location: @quality_category }
      else
        format.html { render action: "new" }
        format.json { render json: @quality_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /quality_categories/1
  # PUT /quality_categories/1.json
  def update
    @quality_category = QualityCategory.find(params[:id])

    respond_to do |format|
      if @quality_category.update_attributes(params[:quality_category])
        format.html { redirect_to @quality_category, notice: 'Quality category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @quality_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quality_categories/1
  # DELETE /quality_categories/1.json
  def destroy
    @quality_category = QualityCategory.find(params[:id])
    @quality_category.destroy

    respond_to do |format|
      format.html { redirect_to quality_categories_url }
      format.json { head :no_content }
    end
  end
end
