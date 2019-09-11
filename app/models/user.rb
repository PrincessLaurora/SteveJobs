class User < ActiveRecord::Base
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable, :omniauthable

  has_many :listings
  has_many :responses, through: :listings
  has_many :reports, through: :listings

  validates :username, :uniqueness => {:case_sensitive => false}
  validates :username, presence: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def self.serialize_into_session(record)
    [record.to_key.map(&:to_s), record.authenticatable_salt]
  end

  def self.serialize_into_cookie(record)
    [record.to_key.map(&:to_s), record.rememberable_value]
  end  

end
