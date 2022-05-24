class API::V1::Mobile::ActivityController < API::V1::Mobile::ApplicationController
  #before_action :check_auth_user_token

  def activities
    activities = Activity.all
    render json: {
      type: RESPONSE_SUCCESSFULLY,
      payload: ActiveModel::Serializer::CollectionSerializer.new(activities, serializer: ActivitySerializer)
    }
  end
end
