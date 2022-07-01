class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  belongs_to :event, optional: true
  protokoll :code, :pattern => "USER%y%m#####"

  TYPES_ROLE = [['ADMINISTRADOR','ADMINISTRATOR'],['GUARDIA','STAFF'],['INVITADO','GUEST']]

  def generate_app_token
    app_token = Devise.friendly_token[0, 10]
    update(app_token: app_token)
  end

  def full_name
    "#{name} #{last_name}"
  end

  def self.get_rol_invited
    TYPES_ROLE[2][1]
  end
end
