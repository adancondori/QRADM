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

  def save_group_sanction
    group = Group.find_by(code: params[:code_group])
    sanction = Sanction.find(params[:id])
    value = params[:value]
    observation = params[:observation]
    user = current_user
    group_sanction = GroupSanction.new(amount: value, 
                                      group_id: group.id,
                                      sanction_id: sanction.id,
                                      observation: observation,
                                      user_id: user.id
                                    )
    if (group_sanction.save!)
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
