class AssemblyToolsController < ApplicationController
  # GET /assembly_tools
  # GET /assembly_tools.json
  def index
    @assembly_tools = AssemblyTool.includes(:engine_models).includes(:facility_type).includes(:facility_code).includes(:workshop_process).page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @assembly_tools }
    end
  end

  # GET /assembly_tools/1
  # GET /assembly_tools/1.json
  def show
    @assembly_tool = AssemblyTool.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @assembly_tool }
    end
  end

  # GET /assembly_tools/new
  # GET /assembly_tools/new.json
  def new
    @assembly_tool = AssemblyTool.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @assembly_tool }
    end
  end

  # GET /assembly_tools/1/edit
  def edit
    @assembly_tool = AssemblyTool.find(params[:id])
  end

  # POST /assembly_tools
  # POST /assembly_tools.json
  def create
    @assembly_tool = AssemblyTool.not_confirmed.new(params[:assembly_tool])

    respond_to do |format|
      if @assembly_tool.save
        format.html { redirect_to @assembly_tool, notice: 'Assembly tool was successfully created.' }
        format.json { render json: @assembly_tool, status: :created, location: @assembly_tool }
      else
        format.html { render action: "new" }
        format.json { render json: @assembly_tool.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /assembly_tools/1
  # PUT /assembly_tools/1.json
  def update
    @assembly_tool = AssemblyTool.find_by_id(params[:id])

    respond_to do |format|
      if !@assembly_tool.is_confirm && @assembly_tool.update_attributes(params[:assembly_tool])
        format.html { redirect_to @assembly_tool, notice: 'Assembly tool was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { redirect_to @assembly_tool, :notice => 'update failed.' }
        format.json { render json: @assembly_tool.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assembly_tools/1
  # DELETE /assembly_tools/1.json
  def destroy
    @assembly_tool = AssemblyTool.find(params[:id])
    @assembly_tool.destroy

    respond_to do |format|
      format.html { redirect_to assembly_tools_url }
      format.json { head :no_content }
    end
  end

  def confirm
    @assembly_tool = AssemblyTool.find(params[:id])
    
    respond_to do |format|
      if @assembly_tool.confirm! && @assembly_tool.save
        format.html { redirect_to assembly_tools_url, :notice => 'Assembly Tool was successfully confirmed' }
        format.json { head :no_content }
      else
        format.html { redirect_to assembly_tools_url, notice: 'Assembly Tool was NOT confirmed' }
        format.json { head json: @assembly_tool.errors, status: :unprocessable_entity }
      end
    end
  end

  def search
  end
end
