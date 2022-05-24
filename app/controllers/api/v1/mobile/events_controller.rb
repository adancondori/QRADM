class API::V1::Mobile::EventsController < API::V1::Mobile::ApplicationController
  #before_action :check_auth_user_token

  def events
    events = Event.all
    render json: {
      type: RESPONSE_SUCCESSFULLY,
      payload: ActiveModel::Serializer::CollectionSerializer.new(events, serializer: EventSerializer)
    }
  end
end
