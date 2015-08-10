class DomainUpdateLogsController < ApplicationController
  before_action :set_domain_update_log, only: [:show, :edit, :update, :destroy]

  # GET /domain_update_logs
  # GET /domain_update_logs.json
  def index
   #@condition = [] 
   #@condition[0]= "created_at>" + params[:start_at] if params[:start_at] 
   #@domain_update_logs = DomainUpdateLog.where @condition
   #@user_logs = UserLog.where @condition
   if params[:start_id]
     @domain_update_logs = DomainUpdateLog.where('id>?', params[:start_id])
   else
     @domain_update_logs = DomainUpdateLog.all
   end

  end

  # GET /domain_update_logs/1
  # GET /domain_update_logs/1.json
  def show
  end

  # GET /domain_update_logs/new
  def new
    @domain_update_log = DomainUpdateLog.new
  end

  # GET /domain_update_logs/1/edit
  def edit
  end

  # POST /domain_update_logs
  # POST /domain_update_logs.json
  def create
    @domain_update_log = DomainUpdateLog.new(domain_update_log_params)

    respond_to do |format|
      if @domain_update_log.save
        format.html { redirect_to @domain_update_log, notice: 'Domain update log was successfully created.' }
        format.json { render :show, status: :created, location: @domain_update_log }
      else
        format.html { render :new }
        format.json { render json: @domain_update_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /domain_update_logs/1
  # PATCH/PUT /domain_update_logs/1.json
  def update
    respond_to do |format|
      if @domain_update_log.update(domain_update_log_params)
        format.html { redirect_to @domain_update_log, notice: 'Domain update log was successfully updated.' }
        format.json { render :show, status: :ok, location: @domain_update_log }
      else
        format.html { render :edit }
        format.json { render json: @domain_update_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /domain_update_logs/1
  # DELETE /domain_update_logs/1.json
  def destroy
    @domain_update_log.destroy
    respond_to do |format|
      format.html { redirect_to domain_update_logs_url, notice: 'Domain update log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_domain_update_log
    @domain_update_log = DomainUpdateLog.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def domain_update_log_params
    params.require(:domain_update_log).permit(:operation, :domain_name)
  end
end
