require 'place'

class World
   attr_accessor :place

  def initialize(place_list=[])
    @places = {}
    place_list.each do |p|
      name = p[:name]
      description = p[:description]
      options = p[:options]
      @places[name] = Place.new(name, description, options)
    end 
  end

  def find_place(place_name)
    @places[place_name] 
  end
  
end
