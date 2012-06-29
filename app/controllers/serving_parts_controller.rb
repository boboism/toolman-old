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
    respond_to do |format|
      if @tool_material.not_over_service_quantity?
        @in_service_tool_part = @tool_material.serving_parts.new(:part_no => @tool_material.tool_no,
                                                                 :category_id => @tool_material.category.id,
                                                                 :sub_category_id => @tool_material.sub_category.id,
                                                                 :model => @tool_material.model,
                                                                 :total_process_quantity => 0,
                                                                 :total_sharpen_time => 0
                                                                )
        format.html # new.html.erb
        format.json { render json: @in_service_tool_part }
      else
        format.html { redirect_to tool_material_serving_parts_url(@tool_material), :notice => 'Over service quantity.' }
        format.json { render json: @in_service_tool_part.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @in_service_tool_part = @tool_material.serving_parts.find(params[:id])
  end

  def create
    @in_service_tool_part = @tool_material.serving_parts.build(params[:tool_part])
    respond_to do |format|
      if @tool_material.not_over_service_quantity? && @in_service_tool_part.save
        format.html { redirect_to tool_material_serving_part_url(@tool_material,@in_service_tool_part), notice: 'In service tool part was successfully created.' }
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

    respond_to do |format|
      if @tool_material.mass_create_serving_parts
        format.html { redirect_to tool_material_serving_parts_url(@tool_material), notice: 'In service tool part was successfully created.' }
      else
        format.html { render action: "index" }
      end
    end
  end

  def update
    @in_service_tool_part = @tool_material.serving_parts.find(params[:id])

    respond_to do |format|
      if @in_service_tool_part.update_attributes(params[:tool_part])
        format.html { redirect_to tool_material_serving_part_url(@tool_material, @in_service_tool_part), notice: 'In service tool part was successfully updated.' }
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

end
