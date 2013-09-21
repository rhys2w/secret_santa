class MatchesController < ApplicationController

def create_match
  #repeat this in a loop until all items are paired
  @things = Thing.all(:order => 'RANDOM()', :limit => 2)
end



end