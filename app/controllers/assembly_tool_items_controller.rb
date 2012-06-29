class AssemblyToolItemsController < ApplicationController
  before_filter :find_assembly_tool
  def index
    @assembly_tool_items = @assembly_tool.items.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @assembly_tool_items }
    end
  end

  def show
    @assembly_tool_item = @assembly_tool.items.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @assembly_tool_item }
    end
  end

  def new
    @assembly_tool_item = @assembly_tool.items.build
    
    respond_to do |format|
      unless @assembly_tool.is_confirm
        @assembly_tool_item = @assembly_tool.items.build
        format.html # new.html.erb
        format.json { render json: @assembly_tool_item }
      else
        format.html {redirect_to assembly_tool_items_url(@assembly_tool), :notice => "Assembly Tool's confirmed."}
      end
    end
  end

  def edit
    @assembly_tool_item = @assembly_tool.items.find(params[:id])
  end

  def create
    @assembly_tool_item = @assembly_tool.items.new(params[:assembly_tool_item])
    respond_to do |format|
      if @assembly_tool_item.save
        format.html { redirect_to assembly_tool_item_url(@assembly_tool,@assembly_tool_item), notice: 'Assembly tool was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @assembly_tool_item = @assembly_tool.items.find(params[:id])
    respond_to do |format|
      if !@assembly_tool.is_confirm && @assembly_tool_item.update_attributes(params[:assembly_tool_item])
        format.html { redirect_to assembly_tool_items_url(@assembly_tool), notice: 'Assembly tool was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { redirect_to edit_assembly_tool_item_url(@assembly_tool, @assembly_tool_item), :notice => "update fail!" }
        #format.html { render action: "edit",:notice => "update fail!" }
        format.json { render json: @assembly_tool_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @assembly_tool_item = @assembly_tool.items.find(params[:id])

    respond_to do |format|
      if !@assembly_tool.is_confirm && @assembly_tool_item.destroy
        format.html { redirect_to assembly_tool_items_url }
        format.json { head :no_content }
      else
        format.html { redirect_to assembly_tool_items_url, :notice => "destroy fail" }
      end
    end
  end

  protected

  def find_assembly_tool
    @assembly_tool = AssemblyTool.find(params[:assembly_tool_id])
  end
end
