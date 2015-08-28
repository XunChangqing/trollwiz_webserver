class TmpDomainNamesController < ApplicationController
  before_action :set_tmp_domain_name, only: [:show, :edit, :update, :destroy]

  # GET /tmp_domain_names
  # GET /tmp_domain_names.json
  def index
    @tmp_domain_names = TmpDomainName.all
  end

  # GET /tmp_domain_names/1
  # GET /tmp_domain_names/1.json
  def show
  end

  # GET /tmp_domain_names/new
  def new
    @tmp_domain_name = TmpDomainName.new
  end

  # GET /tmp_domain_names/1/edit
  def edit
  end

  # POST /tmp_domain_names
  # POST /tmp_domain_names.json
  def create
    @tmp_domain_name = TmpDomainName.new(tmp_domain_name_params)

    respond_to do |format|
      if @tmp_domain_name.save
        format.html { redirect_to @tmp_domain_name, notice: 'Tmp domain name was successfully created.' }
        format.json { render :show, status: :created, location: @tmp_domain_name }
      else
        format.html { render :new }
        format.json { render json: @tmp_domain_name.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PATCH/PUT /tmp_domain_names/1
  # PATCH/PUT /tmp_domain_names/1.json
  def update
    respond_to do |format|
      if @tmp_domain_name.update(tmp_domain_name_params)
        format.html { redirect_to @tmp_domain_name, notice: 'Tmp domain name was successfully updated.' }
        format.json { render :show, status: :ok, location: @tmp_domain_name }
      else
        format.html { render :edit }
        format.json { render json: @tmp_domain_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tmp_domain_names/1
  # DELETE /tmp_domain_names/1.json
  def destroy
    @tmp_domain_name.destroy
    respond_to do |format|
      format.html { redirect_to tmp_domain_names_url, notice: 'Tmp domain name was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tmp_domain_name
      @tmp_domain_name = TmpDomainName.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tmp_domain_name_params
      params.require(:tmp_domain_name).permit(:domain_name)
    end
end
