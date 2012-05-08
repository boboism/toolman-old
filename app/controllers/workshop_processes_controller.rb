class WorkshopProcessesController < ApplicationController
  # GET /workshop_processes
  # GET /workshop_processes.json
  def index
    @workshop_processes = WorkshopProcess.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @workshop_processes }
    end
  end

  # GET /workshop_processes/1
  # GET /workshop_processes/1.json
  def show
    @workshop_process = WorkshopProcess.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @workshop_process }
    end
  end

  # GET /workshop_processes/new
  # GET /workshop_processes/new.json
  def new
    @workshop_process = WorkshopProcess.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @workshop_process }
    end
  end

  # GET /workshop_processes/1/edit
  def edit
    @workshop_process = WorkshopProcess.find(params[:id])
  end

  # POST /workshop_processes
  # POST /workshop_processes.json
  def create
    @workshop_process = WorkshopProcess.new(params[:workshop_process])

    respond_to do |format|
      if @workshop_process.save
        format.html { redirect_to @workshop_process, notice: 'Workshop process was successfully created.' }
        format.json { render json: @workshop_process, status: :created, location: @workshop_process }
      else
        format.html { render action: "new" }
        format.json { render json: @workshop_process.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /workshop_processes/1
  # PUT /workshop_processes/1.json
  def update
    @workshop_process = WorkshopProcess.find(params[:id])

    respond_to do |format|
      if @workshop_process.update_attributes(params[:workshop_process])
        format.html { redirect_to @workshop_process, notice: 'Workshop process was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @workshop_process.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workshop_processes/1
  # DELETE /workshop_processes/1.json
  def destroy
    @workshop_process = WorkshopProcess.find(params[:id])
    @workshop_process.destroy

    respond_to do |format|
      format.html { redirect_to workshop_processes_url }
      format.json { head :no_content }
    end
  end
end
