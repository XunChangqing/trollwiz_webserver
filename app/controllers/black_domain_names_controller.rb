class BlackDomainNamesController < ApplicationController
  before_action :set_black_domain_name, only: [:show, :edit, :update, :destroy]

  # GET /black_domain_names
  # GET /black_domain_names.json
  def index
    @black_domain_names = BlackDomainName.all
  end

  # GET /black_domain_names/1
  # GET /black_domain_names/1.json
  def show
  end

  # GET /black_domain_names/new
  def new
    @black_domain_name = BlackDomainName.new
  end

  # GET /black_domain_names/1/edit
  def edit
  end

  # POST /black_domain_names
  # POST /black_domain_names.json
  def create
    @black_domain_name = BlackDomainName.new(black_domain_name_params)

    respond_to do |format|
      if @black_domain_name.save
        @domain_update_log = DomainUpdateLog.new
        @domain_update_log.domain_name = @black_domain_name.domain_name
        @domain_update_log.operation = 3
        @domain_update_log.save
        format.html { redirect_to @black_domain_name, notice: 'Black domain name was successfully created.' }
        format.json { render :show, status: :created, location: @black_domain_name }
      else
        format.html { render :new }
        format.json { render json: @black_domain_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /black_domain_names/1
  # PATCH/PUT /black_domain_names/1.json
  def update
    respond_to do |format|
      if @black_domain_name.update(black_domain_name_params)
        format.html { redirect_to @black_domain_name, notice: 'Black domain name was successfully updated.' }
        format.json { render :show, status: :ok, location: @black_domain_name }
      else
        format.html { render :edit }
        format.json { render json: @black_domain_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /black_domain_names/1
  # DELETE /black_domain_names/1.json
  def destroy
    @black_domain_name.destroy
    @domain_update_log = DomainUpdateLog.new
    @domain_update_log.domain_name = @black_domain_name.domain_name
    @domain_update_log.operation = 4
    @domain_update_log.save
    respond_to do |format|
      format.html { redirect_to black_domain_names_url, notice: 'Black domain name was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_black_domain_name
    @black_domain_name = BlackDomainName.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def black_domain_name_params
    params.require(:black_domain_name).permit(:domain_name)
  end
end
