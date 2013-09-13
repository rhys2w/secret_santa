class Match < ActiveRecord::Base
  belongs_to :gifter, class_name: "User"
  belongs_to :giftee, class_name: "User"
  validates :gifter_id, presence: true
  validates :giftee_id, presence: true
end
