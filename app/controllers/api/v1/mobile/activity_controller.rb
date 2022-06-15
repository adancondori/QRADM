class API::V1::Mobile::ActivityController < API::V1::Mobile::ApplicationController
  #before_action :check_auth_user_token

  def activities
    activities = Activity.all
    render json: {
      type: RESPONSE_SUCCESSFULLY,
      payload: ActiveModel::Serializer::CollectionSerializer.new(activities, serializer: ActivitySerializer)
    }
  end

  def my_activities
    activities = Activity.all
    code = params[:code_group]
    render json: {
      type: RESPONSE_SUCCESSFULLY,
      payload: ActiveModel::Serializer::CollectionSerializer.new(activities, serializer: ActivitySerializer, code: code)
    }
  end
end
