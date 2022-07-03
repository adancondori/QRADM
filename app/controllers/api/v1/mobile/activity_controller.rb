class API::V1::Mobile::ActivityController < API::V1::Mobile::ApplicationController
  #before_action :check_auth_user_token

  def activities
    activities = Activity.visible.all
    render json: {
      type: RESPONSE_SUCCESSFULLY,
      payload: ActiveModel::Serializer::CollectionSerializer.new(activities, serializer: ActivitySerializer)
    }
  end

  def my_activities
    activities = Activity.visible.all
    code = params[:code_group]
    render json: {
      type: RESPONSE_SUCCESSFULLY,
      payload: ActiveModel::Serializer::CollectionSerializer.new(activities, serializer: ActivitySerializer, code: code)
    }
  end

  def save_group_activity
    group = Group.find_by(code: params[:code_group])
    activity = Activity.find(params[:id])
    value = params[:value]
    observation = params[:observation]
    user = current_user
    existModel = GroupActivity.where("group_id = #{group.id} and activity_id = #{activity.id}").first
    group_activity = GroupActivity.new(amount: value, 
                                      group_id: group.id,
                                      activity_id: activity.id,
                                      observation: observation,
                                      user_id: user.id)
    if existModel.present?
      render json: {
        type: RESPONSE_BAD,
        msg: 'La informacion ya existe en el Sistema, contactese con su Administrador.'
      }
    elsif (group_activity.save!)
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
