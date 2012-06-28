class ServiceStockOrdersController < ApplicationController
  # GET /service_stock_orders
  # GET /service_stock_orders.json
  def index
    @service_stock_orders = ServiceStockOrder.order('operation_date desc')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @service_stock_orders }
    end
  end

  # GET /service_stock_orders/1
  # GET /service_stock_orders/1.json
  def show
    @service_stock_order = ServiceStockOrder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @service_stock_order }
    end
  end

  # GET /service_stock_orders/new
  # GET /service_stock_orders/new.json
  def new_out
    @service_stock_order = current_user.service_stock_orders.stock_out.new(
      :operator => current_user)
    respond_to do |format|
      format.html { render "new" }
      format.json { render json: @service_stock_order }
    end
  end

  def new_in
    now = Date.new
    @service_stock_order = current_user.service_stock_orders.stock_in.new(
      :operator => current_user,
      :doc_date => now,
      :operation_date => now
    )

    respond_to do |format|
      format.html { render "new" }
      format.json { render json: @service_stock_order }
    end
  end



  # GET /service_stock_orders/1/edit
  def edit
    @service_stock_order = ServiceStockOrder.find(params[:id])
  end

  # POST /service_stock_orders
  # POST /service_stock_orders.json
  def create
    @service_stock_order = ServiceStockOrder.new(params[:service_stock_order])

    respond_to do |format|
      if @service_stock_order.save
        format.html { redirect_to @service_stock_order, notice: 'Service stock order was successfully created.' }
        format.json { render json: @service_stock_order, status: :created, location: @service_stock_order }
      else
        format.html { render action: "new" }
        format.json { render json: @service_stock_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /service_stock_orders/1
  # PUT /service_stock_orders/1.json
  def update
    @service_stock_order = ServiceStockOrder.find(params[:id])

    respond_to do |format|
      if @service_stock_order.update_attributes(params[:service_stock_order])
        format.html { redirect_to @service_stock_order, notice: 'Service stock order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @service_stock_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /service_stock_orders/1
  # DELETE /service_stock_orders/1.json
  def destroy
    @service_stock_order = ServiceStockOrder.find(params[:id])
    @service_stock_order.destroy

    respond_to do |format|
      format.html { redirect_to service_stock_orders_url }
      format.json { head :no_content }
    end
  end
end
