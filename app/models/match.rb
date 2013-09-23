class Match < ActiveRecord::Base
  belongs_to :gifter, class_name: "User"
  belongs_to :giftee, class_name: "User"
  validates :gifter_id, presence: true
  validates :giftee_id, presence: true

  def self.match_users!(exchange_users)
    #how many users are we dealing with
    count = exchange_users.count
    #randomize the users
    random_users = exchange_users.order('random()')
    #loop over each user with an index counted in the variable called number, which starts at zero
    random_users.each_with_index do |user, number|
      #if this is the last user in the exchange, assign them to the first user
      if (number+1) == count
        Match.create(gifter_id: user.id, giftee_id: exchange_users[0])
      else
        #otherwise, assign this user to the one after them
        Match.create(gifter_id: user.id, giftee_id: exchange_users[number+1])
      end
    end
  end



end