require 'uri/http'
class WhiteDomainNamesController < ApplicationController
  before_action :set_white_domain_name, only: [:show, :edit, :update, :destroy]

  # GET /white_domain_names
  # GET /white_domain_names.json
  def index
    @white_domain_names = WhiteDomainName.all
  end

  # GET /white_domain_names/1
  # GET /white_domain_names/1.json
  def show
  end

  # GET /white_domain_names/new
  def new
    @white_domain_name = WhiteDomainName.new
  end

  # GET /white_domain_names/1/edit
  def edit
  end

  # POST /white_domain_names
  # POST /white_domain_names.json
  def create
    @white_domain_name = WhiteDomainName.new(white_domain_name_params)
    #Rails.logger.info @white_domain_name.domain_name
    #uri = URI.parse(@white_domain_name.domain_name)
    #domain = PublicSuffix.parse(uri.host)
    #@white_domain_name.domain_name = domain.domain

    respond_to do |format|
      if @white_domain_name.save
        @domain_update_log = DomainUpdateLog.new
        @domain_update_log.domain_name = @white_domain_name.domain_name
        @domain_update_log.operation = 1
        @domain_update_log.save
        format.html { redirect_to @white_domain_name, notice: 'White domain name was successfully created.' }
        format.json { render :show, status: :created, location: @white_domain_name }
      else
        format.html { render :new }
        format.json { render json: @white_domain_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /white_domain_names/1
  # PATCH/PUT /white_domain_names/1.json
  def update
    respond_to do |format|
      if @white_domain_name.update(white_domain_name_params)
        format.html { redirect_to @white_domain_name, notice: 'White domain name was successfully updated.' }
        format.json { render :show, status: :ok, location: @white_domain_name }
      else
        format.html { render :edit }
        format.json { render json: @white_domain_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /white_domain_names/1
  # DELETE /white_domain_names/1.json
  def destroy
    @white_domain_name.destroy
    @domain_update_log = DomainUpdateLog.new
    @domain_update_log.domain_name = @white_domain_name.domain_name
    @domain_update_log.operation = 2
    @domain_update_log.save
    respond_to do |format|
      format.html { redirect_to white_domain_names_url, notice: 'White domain name was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_white_domain_name
    @white_domain_name = WhiteDomainName.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def white_domain_name_params
    params.require(:white_domain_name).permit(:domain_name)
  end
end
