class ErrorReportsController < ApplicationController
  before_action :set_error_report, only: [:show, :edit, :update, :destroy]

  # GET /error_reports
  # GET /error_reports.json
  def index
    @error_reports = ErrorReport.all
  end

  # GET /error_reports/1
  # GET /error_reports/1.json
  def show
  end

  # GET /error_reports/new
  def new
    @error_report = ErrorReport.new
  end

  # GET /error_reports/1/edit
  def edit
  end

  # POST /error_reports
  # POST /error_reports.json
  def create
    @error_report = ErrorReport.new(error_report_params)

    respond_to do |format|
      if @error_report.save
        format.html { redirect_to @error_report, notice: 'Error report was successfully created.' }
        format.json { render :show, status: :created, location: @error_report }
      else
        format.html { render :new }
        format.json { render json: @error_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /error_reports/1
  # PATCH/PUT /error_reports/1.json
  def update
    respond_to do |format|
      if @error_report.update(error_report_params)
        format.html { redirect_to @error_report, notice: 'Error report was successfully updated.' }
        format.json { render :show, status: :ok, location: @error_report }
      else
        format.html { render :edit }
        format.json { render json: @error_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /error_reports/1
  # DELETE /error_reports/1.json
  def destroy
    @error_report.destroy
    respond_to do |format|
      format.html { redirect_to error_reports_url, notice: 'Error report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_error_report
      @error_report = ErrorReport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def error_report_params
      params.require(:error_report).permit(:version, :error_message, :closed, :note)
    end
end
