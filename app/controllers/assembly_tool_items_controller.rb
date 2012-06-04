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
      format.html # new.html.erb
      format.json { render json: @assembly_tool_item }
    end
  end

  def edit
    @assembly_tool_item = @assembly_tool.items.find(params[:id])
  end

  def create
    @assembly_tool_item = @assembly_tool.items.new(params[:assembly_tool_item])
#    if @assembly_tool_item.quantity != @assembly_tool_item.serving_parts.count
#      respond_to do |format|
#        format.html { render new_assembly_tool_item_path(@assembly_tool), notice: 'amount of selected service tool parts larger then quantity' }
#      end
#      return
#    end
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
    if @assembly_tool_item.quantity < @assembly_tool_item.serving_parts.count
      respond_to do |format|
        format.html { redirect_to edit_assembly_tool_item_url(@tool_material), notice: "amount of selected in service toolparts larger than quantity" }
        format.json { render json: @assembly_tool_item.errors, status: :unprocessable_entity }
      end
      return
    end
    respond_to do |format|
      if @assembly_tool_item.update_attributes(params[:assembly_tool_item])
        format.html { redirect_to assembly_tool_items_url(@tool_material), notice: 'Assembly tool was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @assembly_tool_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @assembly_tool_item = @assembly_tool.items.find(params[:id])
    @assembly_tool_item.destroy

    respond_to do |format|
      format.html { redirect_to assembly_tool_items_url }
      format.json { head :no_content }
    end
  end

  protected

  def find_assembly_tool
    @assembly_tool = AssemblyTool.find(params[:assembly_tool_id])
  end
end
