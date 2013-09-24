class Match < ActiveRecord::Base
  belongs_to :gifter, class_name: "User"
  belongs_to :giftee, class_name: "User"

  validates :gifter_id, presence: true
  validates :giftee_id, presence: true

  belongs_to :exchange

  def self.match_users!(exchange)
    puts exchange.inspect
    exchange_id = exchange.id
    #how many users are we dealing with
    count = exchange.users.count
    #randomize the users
    random_users = exchange.users.order('random()')
    #loop over each user with an index counted in the variable called number, which starts at zero
    #puts this in a begin rescue end block so if the create fails, the whole statement will return false.
    begin
      random_users.each_with_index do |user, number|
        #if this is the last user in the exchange, assign them to the first user
        if (number+1) == count
          Match.create!(gifter_id: user.id, giftee_id: random_users[0].id, exchange_id: exchange_id)
        else
          #otherwise, assign this user to the one after them
          Match.create!(gifter_id: user.id, giftee_id: random_users[number+1].id, exchange_id: exchange_id)
        end
      end
      true
    rescue
      false
    end
  end



end