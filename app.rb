require 'rubygems'
require 'sinatra'
require 'world'

house = {:name => 'house', :description => 'You are in a house', :options => {'up' => 'attic', 'down' => 'cellar'}  }
attic = {:name => 'attic', :description => 'It is dusty and there are cobwebs here.', :options => {'down' => 'house'}  }
cellar = {:name => 'cellar', :description => 'It is pitch black. You are likely to be eaten by a grue.', :options => {'up' => 'house'}  }

world = [house, attic, cellar]

$world = World.new(world)

get '/' do
  "<a href='/house'>Start Game</a>" 
end

get '/:place_name' do
  place = $world.find_place(params[:place_name]) 
  if place
    doc = "<html><p>" +
    place.description +
    "</p>"
    links = place.links
    unless links.nil?
      links.each do |label,destination| 
        doc += "<li><a href=\'/#{destination}\'>#{label}</a></li>"
      end
    end
    doc += "</html>"
    doc
  else
    "<p>There is nothing here.</p>"
  end
end

