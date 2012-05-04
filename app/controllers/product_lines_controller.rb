class ProductLinesController < ApplicationController
  # GET /product_lines
  # GET /product_lines.json
  def index
    @product_lines = ProductLine.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_lines }
    end
  end

  # GET /product_lines/1
  # GET /product_lines/1.json
  def show
    @product_line = ProductLine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product_line }
    end
  end

  # GET /product_lines/new
  # GET /product_lines/new.json
  def new
    @product_line = ProductLine.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product_line }
    end
  end

  # GET /product_lines/1/edit
  def edit
    @product_line = ProductLine.find(params[:id])
  end

  # POST /product_lines
  # POST /product_lines.json
  def create
    @product_line = ProductLine.new(params[:product_line])

    respond_to do |format|
      if @product_line.save
        format.html { redirect_to @product_line, notice: 'Product line was successfully created.' }
        format.json { render json: @product_line, status: :created, location: @product_line }
      else
        format.html { render action: "new" }
        format.json { render json: @product_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /product_lines/1
  # PUT /product_lines/1.json
  def update
    @product_line = ProductLine.find(params[:id])

    respond_to do |format|
      if @product_line.update_attributes(params[:product_line])
        format.html { redirect_to @product_line, notice: 'Product line was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_lines/1
  # DELETE /product_lines/1.json
  def destroy
    @product_line = ProductLine.find(params[:id])
    @product_line.destroy

    respond_to do |format|
      format.html { redirect_to product_lines_url }
      format.json { head :no_content }
    end
  end
end
