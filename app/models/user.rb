class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  belongs_to :event, optional: true
  protokoll :code, :pattern => "USER%y%m#####"

  TYPES_ROLE = [['ADMINISTRADOR','ADMINISTRATOR'],['STAFF','STAFF'],['EDITOR','EDITOR'],['INVITADO','GUEST']]

  def generate_app_token
    app_token = Devise.friendly_token[0, 10]
    update(app_token: app_token)
  end

  def full_name
    "#{name} #{last_name}"
  end

  def self.get_rol_admin
    TYPES_ROLE[0][1]
  end

  def self.get_rol_staff
    TYPES_ROLE[1][1]
  end

  def self.get_rol_editor
    TYPES_ROLE[2][1]
  end

  def self.get_rol_invited
    TYPES_ROLE[3][1]
  end


end
