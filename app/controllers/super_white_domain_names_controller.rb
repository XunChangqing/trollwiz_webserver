class SuperWhiteDomainNamesController < ApplicationController
  before_action :set_super_white_domain_name, only: [:show, :edit, :update, :destroy]

  # GET /super_white_domain_names
  # GET /super_white_domain_names.json
  def index
    @super_white_domain_names = SuperWhiteDomainName.all
  end

  # GET /super_white_domain_names/1
  # GET /super_white_domain_names/1.json
  def show
  end

  # GET /super_white_domain_names/new
  def new
    @super_white_domain_name = SuperWhiteDomainName.new
  end

  # GET /super_white_domain_names/1/edit
  def edit
  end

  # POST /super_white_domain_names
  # POST /super_white_domain_names.json
  def create
    @super_white_domain_name = SuperWhiteDomainName.new(super_white_domain_name_params)

    respond_to do |format|
      if @super_white_domain_name.save
        @domain_update_log = DomainUpdateLog.new
        @domain_update_log.domain_name = @super_white_domain_name.domain_name
        @domain_update_log.operation = 5
        @domain_update_log.save
        format.html { redirect_to @super_white_domain_name, notice: 'Super white domain name was successfully created.' }
        format.json { render :show, status: :created, location: @super_white_domain_name }
      else
        format.html { render :new }
        format.json { render json: @super_white_domain_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /super_white_domain_names/1
  # PATCH/PUT /super_white_domain_names/1.json
  def update
    respond_to do |format|
      if @super_white_domain_name.update(super_white_domain_name_params)
        format.html { redirect_to @super_white_domain_name, notice: 'Super white domain name was successfully updated.' }
        format.json { render :show, status: :ok, location: @super_white_domain_name }
      else
        format.html { render :edit }
        format.json { render json: @super_white_domain_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /super_white_domain_names/1
  # DELETE /super_white_domain_names/1.json
  def destroy
    @super_white_domain_name.destroy
    @domain_update_log = DomainUpdateLog.new
    @domain_update_log.domain_name = @super_white_domain_name.domain_name
    @domain_update_log.operation = 6
    @domain_update_log.save
    respond_to do |format|
      format.html { redirect_to super_white_domain_names_url, notice: 'Super white domain name was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_super_white_domain_name
      @super_white_domain_name = SuperWhiteDomainName.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def super_white_domain_name_params
      params.require(:super_white_domain_name).permit(:domain_name)
    end
end
