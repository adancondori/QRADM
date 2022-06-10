class API::V1::Mobile::ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :check_qradm_token

  RESPONSE_SUCCESSFULLY = 'SUCCESSFULLY'
  RESPONSE_BAD = 'ERROR'

  def check_qradm_token
    local_token = ENV['QRADM_TOKEN']
    request_token = request.headers['HTTP_QRADM_TOKEN']
    render json: { msg: 'NO VALID API KEY', type: RESPONSE_BAD }, status: :unauthorized unless local_token === request_token
  end

  def check_auth_user_token
    current_user
    update_last_login
    render json: { msg: 'Your token is down, or your account was inactivated!', type: RESPONSE_BAD }, status: :unauthorized unless @user
  end

  def current_user
    token_header = request.headers["HTTP_USER_TOKEN"]
    @user = User.find_by_app_token(token_header) if token_header.present?
  end

  def update_last_login
    if @user
      @user.update(last_login: Time.zone.now)
    end
  end
end
