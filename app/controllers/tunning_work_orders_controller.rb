class TunningWorkOrdersController < ApplicationController
  load_and_authorize_resource

  # GET /tunning_work_orders
  # GET /tunning_work_orders.json
  def index
    @tunning_work_orders = TunningWorkOrder.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tunning_work_orders }
    end
  end

  # GET /tunning_work_orders/1
  # GET /tunning_work_orders/1.json
  def show
    @tunning_work_order = TunningWorkOrder.find_by_id(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tunning_work_order }
    end
  end

  # GET /tunning_work_orders/new
  # GET /tunning_work_orders/new.json
  def new
    # @tunning_work_order = TunningWorkOrder.new
    @tunning_work_order = current_user.tunning_work_orders.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tunning_work_order }
    end
  end

  # GET /tunning_work_orders/1/edit
  def edit
    # @tunning_work_order = TunningWorkOrder.find_by_id(params[:id])
    @tunning_work_order = current_user.tunning_work_orders.find_by_id(params[:id])

    unless @tunning_work_order
      respond_to do |format|
        format.html {redirect_to tunning_work_orders_url, notice: 'not tunning work order exists'}
      end
      return
    end
  end

  # POST /tunning_work_orders
  # POST /tunning_work_orders.json
  def create
    @tunning_work_order = TunningWorkOrder.new(params[:tunning_work_order])

    respond_to do |format|
      if @tunning_work_order.save
        format.html { redirect_to @tunning_work_order, notice: 'Tunning work order was successfully created.' }
        format.json { render json: @tunning_work_order, status: :created, location: @tunning_work_order }
      else
        format.html { render action: "new" }
        format.json { render json: @tunning_work_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tunning_work_orders/1
  # PUT /tunning_work_orders/1.json
  def update
    @tunning_work_order = TunningWorkOrder.find_by_id(params[:id])

    respond_to do |format|
      if @tunning_work_order.update_attributes(params[:tunning_work_order])
        format.html { redirect_to @tunning_work_order, notice: 'Tunning work order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tunning_work_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tunning_work_orders/1
  # DELETE /tunning_work_orders/1.json
  def destroy
    # @tunning_work_order = TunningWorkOrder.find_by_id(params[:id])
    @tunning_work_order = current_user.tunning_work_orders.find_by_id(params[:id])
    @tunning_work_order.destroy

    respond_to do |format|
      format.html { redirect_to tunning_work_orders_url }
      format.json { head :no_content }
    end
  end

  def confirm
    @tunning_work_order = TunningWorkOrder.find_by_id(params[:id])
    respond_to do |format|
      if @tunning_work_order.confirm! && @tunning_work_order.save
        format.html { redirect_to tunning_work_orders_url, notice: 'Tunning work order was successfully confirmed.' }
        format.json { head :no_content }
      else
        format.html { redirect_to tunning_work_orders_url, notice: 'Tunning work order was NOT successfully confirmed!' }
        format.json { render json: @tunning_work_order.errors, status: :unprocessable_entry }
      end
    end
  end
end
