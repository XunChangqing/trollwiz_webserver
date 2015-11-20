class WechatUsersController < ApplicationController
  before_action :set_wechat_user, only: [:show, :edit, :update, :destroy]

  # GET /wechat_users
  # GET /wechat_users.json
  def index
    @wechat_users = WechatUser.all
  end

  # GET /wechat_users/1
  # GET /wechat_users/1.json
  def show
  end

  # GET /wechat_users/new
  def new
    @wechat_user = WechatUser.new
  end

  # GET /wechat_users/1/edit
  def edit
  end

  # POST /wechat_users
  # POST /wechat_users.json
  def create
    @wechat_user = WechatUser.new(wechat_user_params)

    respond_to do |format|
      if @wechat_user.save
        format.html { redirect_to @wechat_user, notice: 'Wechat user was successfully created.' }
        format.json { render :show, status: :created, location: @wechat_user }
      else
        format.html { render :new }
        format.json { render json: @wechat_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wechat_users/1
  # PATCH/PUT /wechat_users/1.json
  def update
    respond_to do |format|
      if @wechat_user.update(wechat_user_params)
        format.html { redirect_to @wechat_user, notice: 'Wechat user was successfully updated.' }
        format.json { render :show, status: :ok, location: @wechat_user }
      else
        format.html { render :edit }
        format.json { render json: @wechat_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wechat_users/1
  # DELETE /wechat_users/1.json
  def destroy
    @wechat_user.destroy
    respond_to do |format|
      format.html { redirect_to wechat_users_url, notice: 'Wechat user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wechat_user
      @wechat_user = WechatUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wechat_user_params
      params.require(:wechat_user).permit(:openid, :nickname, :headimgurl)
    end
end
