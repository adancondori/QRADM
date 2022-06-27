class API::V1::Mobile::ExtraPointController < API::V1::Mobile::ApplicationController
  #before_action :check_auth_user_token

  def extrapoints
    extrapoints = ExtraPoint.all
    render json: {
      type: RESPONSE_SUCCESSFULLY,
      payload: ActiveModel::Serializer::CollectionSerializer.new(extrapoints, serializer: ExtraPointSerializer)
    }
  end


  def my_extrapoints
    extrapoints = ExtraPoint.all
    code = params[:code_group]
    render json: {
      type: RESPONSE_SUCCESSFULLY,
      payload: ActiveModel::Serializer::CollectionSerializer.new(extrapoints, serializer: ExtraPointSerializer, code: code)
    }
  end

  def save_group_extrapoint
    group = Group.find_by(code: params[:code_group])
    extrapoint = ExtraPoint.find(params[:id])
    value = params[:value]
    observation = params[:observation]
    user = current_user
    group_extrapoint = GroupExtraPoint.new(amount: value, 
                                      group_id: group.id,
                                      extra_point_id: extrapoint.id,
                                      observation: observation,
                                      user_id: user.id
                                    )
    if (group_extrapoint.save!)
      render json: {
        type: RESPONSE_SUCCESSFULLY
      }
    else
      render json: {
        type: RESPONSE_BAD,
        msg: 'Error al Guardar Datos'
      }
    end
  end
end
