class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_exchange
  has_many :exchanges, through: :user_exchange, dependent: :destroy

  #setup giftee_matches as a proxy to match, which relies on the giftee_id foreign key
  has_many :giftee_matches, foreign_key: :giftee_id, dependent: :destroy, class_name: "Match"
  #alias giftees to the giftee_matches association with the source of giftee
  has_many :giftees, through: :giftee_matches, source: :giftee


  has_many :gifter_matches, foreign_key: :gifter_id, dependent: :destroy, class_name: "Match"
  
  has_many :gifters, through: :gifter_matches, source: :gifter
  

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
