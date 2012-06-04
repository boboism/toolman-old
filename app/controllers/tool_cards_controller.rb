class ToolCardsController < ApplicationController
  def index
    @assembly_tools = AssemblyTool.carded.all
  end

  def show
    @assembly_tool = AssemblyTool.carded.find_by_id(params[:id])
  end
end
