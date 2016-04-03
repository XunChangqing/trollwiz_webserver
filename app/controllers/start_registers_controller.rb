class StartRegistersController < ApplicationController
  before_action :set_start_register, only: [:show, :edit, :update, :destroy]

  # GET /start_registers
  # GET /start_registers.json
  def index
    @start_registers = StartRegister.all
  end

  # GET /start_registers/1
  # GET /start_registers/1.json
  def show
  end

  # GET /start_registers/new
  def new
    @start_register = StartRegister.new
  end

  # GET /start_registers/1/edit
  def edit
  end

  # POST /start_registers
  # POST /start_registers.json
  def create
    @start_register = StartRegister.new(start_register_params)

    respond_to do |format|
      if @start_register.save
        format.html { redirect_to @start_register, notice: 'Start register was successfully created.' }
        format.json { render :show, status: :created, location: @start_register }
      else
        format.html { render :new }
        format.json { render json: @start_register.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /start_registers/1
  # PATCH/PUT /start_registers/1.json
  def update
    respond_to do |format|
      if @start_register.update(start_register_params)
        format.html { redirect_to @start_register, notice: 'Start register was successfully updated.' }
        format.json { render :show, status: :ok, location: @start_register }
      else
        format.html { render :edit }
        format.json { render json: @start_register.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /start_registers/1
  # DELETE /start_registers/1.json
  def destroy
    @start_register.destroy
    respond_to do |format|
      format.html { redirect_to start_registers_url, notice: 'Start register was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_start_register
      @start_register = StartRegister.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def start_register_params
      params.require(:start_register).permit(:user_id, :note)
    end
end
