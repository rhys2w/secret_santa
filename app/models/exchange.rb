class Exchange < ActiveRecord::Base
  has_many :user_exchange
  has_many :users, through: :user_exchange
end
