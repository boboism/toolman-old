class CombinationToolsController < ApplicationController
  # GET /combination_tools
  # GET /combination_tools.json
  def index
    @combination_tools = CombinationTool.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @combination_tools }
    end
  end

  # GET /combination_tools/1
  # GET /combination_tools/1.json
  def show
    @combination_tool = CombinationTool.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @combination_tool }
    end
  end

  # GET /combination_tools/new
  # GET /combination_tools/new.json
  def new
    @combination_tool = CombinationTool.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @combination_tool }
    end
  end

  # GET /combination_tools/1/edit
  def edit
    @combination_tool = CombinationTool.find(params[:id])
  end

  # POST /combination_tools
  # POST /combination_tools.json
  def create
    @combination_tool = CombinationTool.new(params[:combination_tool])

    respond_to do |format|
      if @combination_tool.save
        format.html { redirect_to @combination_tool, notice: 'Combination tool was successfully created.' }
        format.json { render json: @combination_tool, status: :created, location: @combination_tool }
      else
        format.html { render action: "new" }
        format.json { render json: @combination_tool.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /combination_tools/1
  # PUT /combination_tools/1.json
  def update
    @combination_tool = CombinationTool.find(params[:id])

    respond_to do |format|
      if @combination_tool.update_attributes(params[:combination_tool])
        format.html { redirect_to @combination_tool, notice: 'Combination tool was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @combination_tool.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /combination_tools/1
  # DELETE /combination_tools/1.json
  def destroy
    @combination_tool = CombinationTool.find(params[:id])
    @combination_tool.destroy

    respond_to do |format|
      format.html { redirect_to combination_tools_url }
      format.json { head :no_content }
    end
  end
end
