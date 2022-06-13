class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :event, optional: true
  protokoll :code, :pattern => "USER%y%m#####"

  def generate_app_token
    app_token = Devise.friendly_token[0, 10]
    update(app_token: app_token)
  end
end
