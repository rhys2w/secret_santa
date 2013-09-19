class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_exchange
  has_many :exchanges, through: :user_exchange, dependent: :destroy

  has_many :relationships, foreign_key: "gifter_id", dependent: :destroy
  has_many :giftee_users, through: :relationships, source: :giftee
  has_many :reverse_relationships, foreign_key: "giftee_id",
                                   class_name:  "Matches",
                                   dependent:   :destroy
  has_many :gifters, through: :reverse_relationships, source: :gifter

  # validates_presence_of :email, :password_digest unless :guest?
  # validates_uniqueness_of :email, allow_blank: true
  # validates_confirmation_of :password

  # require 'bcrypt'
  # attr_reader :password
  # include ActiveModel::SecurePassword::InstanceMethodsOnActivation

  def self.new_guest
    new { |u| u.guest = true}
  end

  def move_to(user)
    exchanges.update_all(user_id: user.id)
  end

end
