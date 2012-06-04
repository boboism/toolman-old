class ScrapOrdersController < ApplicationController
  # GET /scrap_orders
  # GET /scrap_orders.json
  def index
    @scrap_orders = ScrapOrder.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @scrap_orders }
    end
  end

  # GET /scrap_orders/1
  # GET /scrap_orders/1.json
  def show
    @scrap_order = ScrapOrder.find_by_id(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @scrap_order }
    end
  end

  # GET /scrap_orders/new
  # GET /scrap_orders/new.json
  def new
    # @scrap_order = ScrapOrder.new
    @scrap_order = current_user.scrap_orders.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @scrap_order }
    end
  end

  # GET /scrap_orders/1/edit
  def edit
    @scrap_order = ScrapOrder.find_by_id(params[:id])
  end

  # POST /scrap_orders
  # POST /scrap_orders.json
  def create
    @scrap_order = ScrapOrder.uncompleted.new(params[:scrap_order])

    respond_to do |format|
      if @scrap_order.save
        format.html { redirect_to @scrap_order, notice: 'Scrap order was successfully created.' }
        format.json { render json: @scrap_order, status: :created, location: @scrap_order }
      else
        format.html { render action: "new" }
        format.json { render json: @scrap_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /scrap_orders/1
  # PUT /scrap_orders/1.json
  def update
    @scrap_order = ScrapOrder.find_by_id(params[:id])

    respond_to do |format|
      if !@scrap_order.confirmed && @scrap_order.update_attributes(params[:scrap_order])
        format.html { redirect_to @scrap_order, notice: 'Scrap order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @scrap_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scrap_orders/1
  # DELETE /scrap_orders/1.json
  def destroy
    @scrap_order = ScrapOrder.unconfirmed.find_by_id(params[:id])

    respond_to do |format|
      if @scrap_order && @scrap_order.destroy 
        format.html { redirect_to scrap_orders_url, :notice => 'Scrap Order successfully destroy.' }
        format.json { render :no_content }
      else
        format.html { redirect_to scrap_orders_url, :notice => 'Scrap Order can NOT destroy.' }
        format.json { head :no_content }
      end
    end
  end

  def confirm
    @scrap_order = ScrapOrder.unconfirmed.find_by_id(params[:id])
    respond_to do |format|
      if @scrap_order && @scrap_order.confirm!
        format.html { redirect_to @scrap_order, notice: 'Scrap order was successfully confirmed.' }
        format.json { head :no_content }
      else
        format.html { redirect_to scrap_orders_url, notice: 'Scrap order was NOT successfully confirmed.' }
        format.json { render json: @scrap_order.errors, status: :unprocessable_entity }
      end
    end
  end
end
