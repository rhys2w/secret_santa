class Match < ActiveRecord::Base
  belongs_to :gifter, class_name: "User"
  belongs_to :giftee, class_name: "User"
  validates :gifter_id, presence: true
  validates :giftee_id, presence: true

  def self.match_users!(exchange_users)
    count = exchange_users.count

    random_users = exchange_users.order('random()')
    random_users.each_with_index do |user, number|
      if (number+1) == count
        Match.create(gifter_id: user.id, giftee_id: exchange_users[0])
      else
        Match.create(gifter_id: user.id, giftee_id: exchange_users[number+1])
      end
    end
  end



end

    #how many users are we dealing with
    #randomize the users
    #loop over each user with an index counted in the variable called number, which starts at zero
    #if this is the last user in the exchange, assign them to the first user
    #otherwise, assign this user to the one after them
