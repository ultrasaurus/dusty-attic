require 'place'

class Zork
   attr_accessor :place

  def initialize
    @place = Place.new
  end

  def follow(where)
    @place.links[where]
  end
  
  # go_place("a link name") ... it will set @place to the new place
end