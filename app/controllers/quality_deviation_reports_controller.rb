class QualityDeviationReportsController < ApplicationController
  # GET /quality_deviation_reports
  # GET /quality_deviation_reports.json
  def index
    @quality_deviation_reports = QualityDeviationReport.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @quality_deviation_reports }
    end
  end

  # GET /quality_deviation_reports/1
  # GET /quality_deviation_reports/1.json
  def show
    @quality_deviation_report = QualityDeviationReport.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @quality_deviation_report }
    end
  end

  # GET /quality_deviation_reports/new
  # GET /quality_deviation_reports/new.json
  def new
    @quality_deviation_report = QualityDeviationReport.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @quality_deviation_report }
    end
  end

  # GET /quality_deviation_reports/1/edit
  def edit
    @quality_deviation_report = QualityDeviationReport.find(params[:id])
  end

  # POST /quality_deviation_reports
  # POST /quality_deviation_reports.json
  def create
    @quality_deviation_report = QualityDeviationReport.new(params[:quality_deviation_report])

    respond_to do |format|
      if @quality_deviation_report.save
        format.html { redirect_to @quality_deviation_report, notice: 'Quality deviation report was successfully created.' }
        format.json { render json: @quality_deviation_report, status: :created, location: @quality_deviation_report }
      else
        format.html { render action: "new" }
        format.json { render json: @quality_deviation_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /quality_deviation_reports/1
  # PUT /quality_deviation_reports/1.json
  def update
    @quality_deviation_report = QualityDeviationReport.find(params[:id])

    respond_to do |format|
      if @quality_deviation_report.update_attributes(params[:quality_deviation_report])
        format.html { redirect_to @quality_deviation_report, notice: 'Quality deviation report was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @quality_deviation_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quality_deviation_reports/1
  # DELETE /quality_deviation_reports/1.json
  def destroy
    @quality_deviation_report = QualityDeviationReport.unconfirmed.find(params[:id])

    respond_to do |format|
      if @quality_deviation_report and @quality_deviation_report.destroy
        format.html { redirect_to quality_deviation_reports_url }
        format.json { head :no_content }
      else
        format.html { redirect_to quality_deviation_reports_url, :notice => 'Quality Deviation Report can NOT destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  def confirm
    @quality_deviation_report = QualityDeviationReport.unconfirmed.find_by_id(params[:id])
    respond_to do |format|
      if @quality_deviation_report && @quality_deviation_report.confirm!
        format.html { redirect_to quality_deviation_reports_url, :notice => 'Quality Deviation Report successfully confirmed.' }
        format.json { head :no_content }
      else
        format.html { redirect_to quality_deviation_reports_url, :notice => 'Quality Deviation Report can NOT confirmed.' }
        format.json { head :no_content }
      end
    end
  end
end
