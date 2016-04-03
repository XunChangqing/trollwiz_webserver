class DomainNamesController < ApplicationController
  #force_ssl except: [:binding, :auth] unless Rails.env.development?
  force_ssl unless Rails.env.development?
  #before_action :validate_token, only: [:show, :edit, :update, :destroy]
  before_action :validate_token
  def update_logs
   if params[:start_id]
     @domain_update_logs = DomainUpdateLog.where('id>?', params[:start_id])
   else
     @domain_update_logs = DomainUpdateLog.all
   end
   render json: @domain_update_logs
  end

  def submit_tmp_domain_name
    @tmp_domain_name = TmpDomainName.new(params.permit(:domain_name))

    if @tmp_domain_name.save
      render json: @tmp_domain_name
    else
      render json: {"error":"already exist"}
    end
  end

  def submit_start_register
    @start_register = StartRegister.new(params.permit(:user_id, :note))

    if @start_register.save
      render json: @start_register
    else
      render json: {"error":"cannot register"}
    end
  end
end



private
def validate_token
  if params[:token] != Rails.application.config.trollwiz['token']
    render json: {"error":"invalid token"}
  end
end
