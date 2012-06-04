class TunningWorkOrderSettingItemsController < ApplicationController
  before_filter :find_tunning_work_order
  
  # GET /tunning_work_order_setting_items
  # GET /tunning_work_order_setting_items.json
  def index
    @tunning_work_order_setting_items = @tunning_work_order.setting_item ? [@tunning_work_order.setting_item,] : []

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tunning_work_order_setting_items }
    end
  end

  # GET /tunning_work_order_setting_items/1
  # GET /tunning_work_order_setting_items/1.json
  def show
    @tunning_work_order_setting_item = @tunning_work_order.setting_item if @tunning_work_order.setting_item.id == params[:id].to_i

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tunning_work_order_setting_item }
    end
  end

  # GET /tunning_work_order_setting_items/new
  # GET /tunning_work_order_setting_items/new.json
  def new
    @tunning_work_order_setting_item = @tunning_work_order.setting_item
    if @tunning_work_order_setting_item
      respond_to do |format|
        format.html { redirect_to tunning_work_order_setting_items_url(@tunning_work_order), notice: 'Already have a setting item' }
      end
      return
    end
    @tunning_work_order_setting_item = @tunning_work_order.build_setting_item
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tunning_work_order_setting_item }
    end
  end

  # GET /tunning_work_order_setting_items/1/edit
  def edit
    # @tunning_work_order_setting_item = TunningWorkOrderSettingItem.find(params[:id])
    @tunning_work_order_setting_item = @tunning_work_order.setting_item if @tunning_work_order.setting_item.id == params[:id].to_i
  end

  # POST /tunning_work_order_setting_items
  # POST /tunning_work_order_setting_items.json
  def create
    @tunning_work_order_setting_item = TunningWorkOrderSettingItem.new(params[:tunning_work_order_setting_item])

    respond_to do |format|
      if @tunning_work_order_setting_item.save
        format.html { redirect_to @tunning_work_order_setting_item, notice: 'Tunning work order setting item was successfully created.' }
        format.json { render json: @tunning_work_order_setting_item, status: :created, location: @tunning_work_order_setting_item }
      else
        format.html { render action: "new" }
        format.json { render json: @tunning_work_order_setting_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tunning_work_order_setting_items/1
  # PUT /tunning_work_order_setting_items/1.json
  def update
    @tunning_work_order_setting_item = TunningWorkOrderSettingItem.find(params[:id])

    respond_to do |format|
      if @tunning_work_order_setting_item.update_attributes(params[:tunning_work_order_setting_item])
        format.html { redirect_to @tunning_work_order_setting_item, notice: 'Tunning work order setting item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tunning_work_order_setting_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tunning_work_order_setting_items/1
  # DELETE /tunning_work_order_setting_items/1.json
  def destroy
    @tunning_work_order_setting_item = TunningWorkOrderSettingItem.find(params[:id])
    @tunning_work_order_setting_item.destroy

    respond_to do |format|
      format.html { redirect_to tunning_work_order_setting_items_url }
      format.json { head :no_content }
    end
  end

  protected
  
  def find_tunning_work_order
    @tunning_work_order = TunningWorkOrder.find(params[:tunning_work_order_id])
  end
end
