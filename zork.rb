require 'place'

class Zork
   attr_accessor :place

  def initialize(filename=nil)
    if filename.nil?
      @place = Place.new
    else
      File.open(filename) do |f|
        @places = YAML::load(f)
        @places.each do |key, place|
          place.name = key
        end
        @place = @places["house"]
      end 
    end
  end

  def follow(where)
    @place.links[where]
  end
  
  # go_place("a link name") ... it will set @place to the new place
end