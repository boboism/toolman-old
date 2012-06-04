class TunningWorkOrderSharpenItemsController < ApplicationController
  # GET /tunning_work_order_sharpen_items
  # GET /tunning_work_order_sharpen_items.json
  def index
    @tunning_work_order_sharpen_items = TunningWorkOrderSharpenItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tunning_work_order_sharpen_items }
    end
  end

  # GET /tunning_work_order_sharpen_items/1
  # GET /tunning_work_order_sharpen_items/1.json
  def show
    @tunning_work_order_sharpen_item = TunningWorkOrderSharpenItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tunning_work_order_sharpen_item }
    end
  end

  # GET /tunning_work_order_sharpen_items/new
  # GET /tunning_work_order_sharpen_items/new.json
  def new
    @tunning_work_order_sharpen_item = TunningWorkOrderSharpenItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tunning_work_order_sharpen_item }
    end
  end

  # GET /tunning_work_order_sharpen_items/1/edit
  def edit
    @tunning_work_order_sharpen_item = TunningWorkOrderSharpenItem.find(params[:id])
  end

  # POST /tunning_work_order_sharpen_items
  # POST /tunning_work_order_sharpen_items.json
  def create
    @tunning_work_order_sharpen_item = TunningWorkOrderSharpenItem.new(params[:tunning_work_order_sharpen_item])

    respond_to do |format|
      if @tunning_work_order_sharpen_item.save
        format.html { redirect_to @tunning_work_order_sharpen_item, notice: 'Tunning work order sharpen item was successfully created.' }
        format.json { render json: @tunning_work_order_sharpen_item, status: :created, location: @tunning_work_order_sharpen_item }
      else
        format.html { render action: "new" }
        format.json { render json: @tunning_work_order_sharpen_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tunning_work_order_sharpen_items/1
  # PUT /tunning_work_order_sharpen_items/1.json
  def update
    @tunning_work_order_sharpen_item = TunningWorkOrderSharpenItem.find(params[:id])

    respond_to do |format|
      if @tunning_work_order_sharpen_item.update_attributes(params[:tunning_work_order_sharpen_item])
        format.html { redirect_to @tunning_work_order_sharpen_item, notice: 'Tunning work order sharpen item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tunning_work_order_sharpen_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tunning_work_order_sharpen_items/1
  # DELETE /tunning_work_order_sharpen_items/1.json
  def destroy
    @tunning_work_order_sharpen_item = TunningWorkOrderSharpenItem.find(params[:id])
    @tunning_work_order_sharpen_item.destroy

    respond_to do |format|
      format.html { redirect_to tunning_work_order_sharpen_items_url }
      format.json { head :no_content }
    end
  end
end
