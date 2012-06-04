class ServingPartsController < ApplicationController
  layout "pdf", :only => :print

  before_filter :find_tool_material
  def index
    @in_service_tool_parts = @tool_material.serving_parts.order(:part_no)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @in_service_tool_parts }
    end
  end

  def show
    @in_service_tool_part = @tool_material.serving_parts.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @in_service_tool_part }
    end
  end

  def new
    @in_service_tool_part = @tool_material.serving_parts.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @in_service_tool_part }
    end
  end

  def edit
    @in_service_tool_part = @tool_material.serving_parts.find(params[:id])
  end

  def create
    @in_service_tool_part = @tool_material.serving_parts.new(params[:in_service_tool_part])
    if @tool_material.current_service_quantity > @tool_material.service_quantity
      respond_to do |format|
        format.html { render action: "new" }
        format.json { render json: @in_service_tool_part.errors, status: :unprocessable_entity }
      end
    end
    respond_to do |format|
      if @in_service_tool_part.save
        format.html { redirect_to @in_service_tool_part, notice: 'In service tool part was successfully created.' }
        format.json { render json: @in_service_tool_part, status: :created, location: @in_service_tool_part }
      else
        format.html { render action: "new" }
        format.json { render json: @in_service_tool_part.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def mass_create
    if not @tool_material.serving_parts.empty?
      respond_to do |format|
        format.html { redirect_to tool_material_serving_parts_url(@tool_material), notice: "only avaliable for empty in service tool parts" }
      end
      return
    end
    # @in_service_tool_parts = @tool_material.serving_parts
    # arrange_tool_material_serving_parts(@tool_material)

    respond_to do |format|
      if @tool_material.mass_create_serving_parts.save
        format.html { redirect_to tool_material_serving_parts_url(@tool_material), notice: 'In service tool part was successfully created.' }
      else
        format.html { render action: "index" }
      end
    end
  end

  def update
    @in_service_tool_part = @tool_material.serving_parts.find(params[:id])

    respond_to do |format|
      if @in_service_tool_part.update_attributes(params[:in_service_tool_part])
        format.html { redirect_to @in_service_tool_part, notice: 'In service tool part was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @in_service_tool_part.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @in_service_tool_part = @tool_material.serving_parts.find(params[:id])
    @in_service_tool_part.destroy

    respond_to do |format|
      format.html { redirect_to tool_material_serving_parts_url(@tool_material), notice: 'destroy successed' }
      format.json { head :no_content }
    end
  end

  def print
    part_nos = (params[:part_no] || "").split(',')
    @in_service_tool_parts = @tool_material.serving_parts
    @in_service_tool_parts = @in_service_tool_parts.find_all_by_part_no(part_nos) unless part_nos.empty?
  end
  protected

  def find_tool_material
    @tool_material = ToolMaterial.find(params[:tool_material_id])
  end

  def arrange_tool_material_serving_parts(tool_material)
    tool_material.service_quantity.times do |index|
      tool_part = tool_material.serving_parts.build
      tool_part.part_no = "#{tool_material.tool_no}_#{index + 1}"
      tool_part.category = tool_material.category
      tool_part.sub_category = tool_material.sub_category
      tool_part.model = tool_material.model
      if tool_material.technical_info.nil?
        tool_part.expected_quantity = 0
        tool_part.expected_sharpen_time = 0 
      else
        tool_part.expected_quantity = tool_material.technical_info.expected_quantity
        tool_part.expected_sharpen_time = tool_material.technical_info.sharpen_time
      end
    end
  end
end
