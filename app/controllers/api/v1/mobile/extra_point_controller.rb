class API::V1::Mobile::ExtraPointController < API::V1::Mobile::ApplicationController
  #before_action :check_auth_user_token

  def extrapoints
    extrapoints = ExtraPoint.all
    render json: {
      type: RESPONSE_SUCCESSFULLY,
      payload: ActiveModel::Serializer::CollectionSerializer.new(extrapoints, serializer: ExtraPointSerializer)
    }
  end
end
