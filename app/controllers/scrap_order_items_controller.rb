class ScrapOrderItemsController < ApplicationController
  before_filter :find_scrap_order

  # GET /scrap_order_items
  # GET /scrap_order_items.json
  def index
    @scrap_order_items = @scrap_order.items.all 

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @scrap_order_items }
    end
  end

  # GET /scrap_order_items/1
  # GET /scrap_order_items/1.json
  def show
    @scrap_order_item = @scrap_order.items.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @scrap_order_item }
    end
  end

  # GET /scrap_order_items/new
  # GET /scrap_order_items/new.json
  def new
    @scrap_order_item = ScrapOrderItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @scrap_order_item }
    end
  end

  # GET /scrap_order_items/1/edit
  def edit
    @scrap_order_item = @scrap_order.items.find(params[:id])
  end

  # POST /scrap_order_items
  # POST /scrap_order_items.json
  def create
    @scrap_order_item = ScrapOrderItem.new(params[:scrap_order_item])

    respond_to do |format|
      if @scrap_order_item.save
        format.html { redirect_to @scrap_order_item, notice: 'Scrap order item was successfully created.' }
        format.json { render json: @scrap_order_item, status: :created, location: @scrap_order_item }
      else
        format.html { render action: "new" }
        format.json { render json: @scrap_order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /scrap_order_items/1
  # PUT /scrap_order_items/1.json
  def update
    @scrap_order_item = @scrap_order.items.find(params[:id])

    respond_to do |format|
      if @scrap_order_item.update_attributes(params[:scrap_order_item])
        format.html { redirect_to @scrap_order_item, notice: 'Scrap order item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @scrap_order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scrap_order_items/1
  # DELETE /scrap_order_items/1.json
  def destroy
    @scrap_order_item = @scrap_order.items.find(params[:id])
    @scrap_order_item.destroy

    respond_to do |format|
      format.html { redirect_to scrap_order_items_url }
      format.json { head :no_content }
    end
  end

  protected
  
  def find_scrap_order
    @scrap_order = ScrapOrder.find(params[:scrap_order_id])
  end
end
