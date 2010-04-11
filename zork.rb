require 'place'

class Zork
   attr_accessor :place

  def initialize(place_hash=nil)
    if place_hash.nil?
      @place = Place.new
    else
      @places = {}
      place_hash.each do |p|
        p name = p[:name]
        p description = p[:description]
        p options = p[:options]
        @places[name] = Place.new(name, description, options)
      end 
      @place = @places['house']
    end
  end

  def follow(where)
    @place.links[where]
  end
  
  def go(place_name)
    new_place = @places[place_name] 
    @place = new_place unless new_place.nil?
  end
  
  # go_place("a link name") ... it will set @place to the new place
end
