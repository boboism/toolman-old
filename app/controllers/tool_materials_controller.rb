class ToolMaterialsController < ApplicationController
  layout "pdf", :only => :print
  load_and_authorize_resource

  # GET /tool_materials
  # GET /tool_materials.json
  def index
    @tool_materials = ToolMaterial.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tool_materials }
      format.xls do
        tm_class = (@tool_materials.first || ToolMaterial.new).class
        send_data(
          @tool_materials.to_xls(ToolMaterial.default_xls_options),
          :filename =>"#{tm_class.model_name.human.singularize}_#{I18n.l(Date.current)}.xls")
      end
    end
  end

  # GET /tool_materials/1
  # GET /tool_materials/1.json
  def show
    @tool_material = ToolMaterial.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tool_material }
    end
  end

  # GET /tool_materials/new
  # GET /tool_materials/new.json
  def new
    @tool_material = ToolMaterial.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tool_material }
    end
  end

  # GET /tool_materials/1/edit
  def edit
    @tool_material = ToolMaterial.find(params[:id])
  end

  # POST /tool_materials
  # POST /tool_materials.json
  def create
    @tool_material = ToolMaterial.new(params[:tool_material])
    respond_to do |format|
      if @tool_material.save
        format.html { redirect_to @tool_material, notice: 'Tool material was successfully created.' }
        format.json { render json: @tool_material, status: :created, location: @tool_material }
      else
        format.html { render action: "new" }
        format.json { render json: @tool_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tool_materials/1
  # PUT /tool_materials/1.json
  def update
    @tool_material = ToolMaterial.find(params[:id])
      
    respond_to do |format|
      if @tool_material.arrange_in_service_tool_parts? and  @tool_material.update_attributes(params[:tool_material])
        @tool_material
        format.html { redirect_to @tool_material, notice: 'Tool material was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tool_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tool_materials/1
  # DELETE /tool_materials/1.json
  def destroy
    @tool_material = ToolMaterial.find(params[:id])
    @tool_material.destroy

    respond_to do |format|
      format.html { redirect_to tool_materials_url }
      format.json { head :no_content }
    end
  end
  
end
