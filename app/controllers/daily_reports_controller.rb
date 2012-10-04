class DailyReportsController < ApplicationController
  # GET /daily_reports
  # GET /daily_reports.json
  def index
    @daily_reports = DailyReport.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @daily_reports }
    end
  end

  # GET /daily_reports/1
  # GET /daily_reports/1.json
  def show
    @daily_report = DailyReport.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @daily_report }
    end
  end

  # GET /daily_reports/new
  # GET /daily_reports/new.json
  def new
    @daily_report = DailyReport.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @daily_report }
    end
  end

  # GET /daily_reports/1/edit
  def edit
    @daily_report = DailyReport.find(params[:id])
  end

  # POST /daily_reports
  # POST /daily_reports.json
  def create
    @daily_report = DailyReport.new(params[:daily_report])

    respond_to do |format|
      if @daily_report.save
        format.html { redirect_to @daily_report, notice: 'Daily report was successfully created.' }
        format.json { render json: @daily_report, status: :created, location: @daily_report }
      else
        format.html { render action: "new" }
        format.json { render json: @daily_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /daily_reports/1
  # PUT /daily_reports/1.json
  def update
    @daily_report = DailyReport.find(params[:id])

    respond_to do |format|
      if @daily_report.update_attributes(params[:daily_report])
        format.html { redirect_to @daily_report, notice: 'Daily report was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @daily_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daily_reports/1
  # DELETE /daily_reports/1.json
  def destroy
    @daily_report = DailyReport.find(params[:id])
    @daily_report.destroy

    respond_to do |format|
      format.html { redirect_to daily_reports_url }
      format.json { head :no_content }
    end
  end
end
