class API::V1::Mobile::AuthController < API::V1::Mobile::ApplicationController
  def sign_up
    # TODO: take the email and first or create the person
    # is is a new person => fill the table referenced person
    ps = PersonService.new
    person_auth = ps.create_or_get(email_params, person_params)
    if person_auth.save
      person_auth.generate_app_token
      render json: {
        type: RESPONSE_SUCCESSFULLY,
        payload: PersonSerializer.new(person_auth, {})
      }
    else
      render json: {
        type: RESPONSE_BAD,
        payload: person_auth.errors
      }, status: :unprocessable_entity
    end
  end

  def log_out
    # TODO: remove token firebase
    current_user
    @person.update(firebase_token: nil, os_type: nil) if @person.present?
    render json: {
      type: RESPONSE_SUCCESSFULLY
    }
  end

  def log_in
    user = current_user
    if user.present?
      sign_in user
      render json: {
        type: RESPONSE_SUCCESSFULLY,
        payload: UserSerializer.new(user)
      }
    else
      render json: {
        type: RESPONSE_BAD,
        msg: 'Error al iniciar Sesion, intente nuevamente.',
        payload: nil
      }, status: 201
    end
  end

  def check_uid
    uuid = params[:uuid]
    provider = params[:provider] # facebook, apple, email
    auth_login = AuthLogin.find_by(uuid: uuid, provider: provider)
    @person = auth_login.person if auth_login.present?

    render json: {
      type: RESPONSE_SUCCESSFULLY,
      payload: {
        present: @person.present?,
        model: @person.present? ? PersonSerializer.new(@person, {}) : nil
      }
    }
  end

  private

  def email_params
    params[:email]
  end

  def person_params
    ActionController::Parameters.new(email: params[:email],
                                     name: params[:name],
                                     last_name: params[:last_name],
                                     invite_code: params[:invite_code],
                                     social_login_id: params[:social_login_id],
                                     social_login_type: params[:social_login_type],
                                     country_id: params[:country_id],
                                     state_id: params[:state_id],
                                     dni: params[:dni],
                                     type_person: TypePerson.find_by_title('guest'),
                                     birthday: params[:birthday],
                                     religion_key: params[:religion_key],
                                     phone_number: params[:phone_number]).permit!
  end
end
