class API::V1::Mobile::SanctionController < API::V1::Mobile::ApplicationController
  #before_action :check_auth_user_token

  def sanctions
    sanctions = Sanction.all
    render json: {
      type: RESPONSE_SUCCESSFULLY,
      payload: ActiveModel::Serializer::CollectionSerializer.new(sanctions, serializer: SanctionSerializer)
    }
  end

  def my_sanctions
    sanctions = Sanction.all
    code = params[:code_group]
    render json: {
      type: RESPONSE_SUCCESSFULLY,
      payload: ActiveModel::Serializer::CollectionSerializer.new(sanctions, serializer: SanctionSerializer, code: code)
    }
  end
end
