class API::V1::Mobile::GroupsController < API::V1::Mobile::ApplicationController
  #before_action :check_auth_user_token

  def groups
    events = Group.all
    render json: {
      type: RESPONSE_SUCCESSFULLY,
      payload: ActiveModel::Serializer::CollectionSerializer.new(events, serializer: GroupSerializer)
    }
  end
end
