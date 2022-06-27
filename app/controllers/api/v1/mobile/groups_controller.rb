class API::V1::Mobile::GroupsController < API::V1::Mobile::ApplicationController
  #before_action :check_auth_user_token

  def groups
    events = Group.all
    render json: {
      type: RESPONSE_SUCCESSFULLY,
      payload: ActiveModel::Serializer::CollectionSerializer.new(events, serializer: GroupSerializer)
    }
  end

  def group_qrscan
    group = Group.find_by(code: params[:code])
    if (group.present?)
      render json: {
        type: RESPONSE_SUCCESSFULLY,
        payload: GroupSerializer.new(group)
      }
    else
      render json: {
        type: RESPONSE_BAD,
        msg: 'Error al Guardar Datos'
      }
    end
  end

  def group_details
    group = Group.find_by(code: params[:code])
    if (group.present?)
      render json: {
        type: RESPONSE_SUCCESSFULLY,
        payload: GroupDetailSerializer.new(group)
      }
    else
      render json: {
        type: RESPONSE_BAD,
        msg: 'Error al Guardar Datos'
      }
    end
  end
end
