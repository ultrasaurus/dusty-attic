require 'rubygems'
require 'sinatra'
require 'zork'

house = {:name => 'house', :description => 'You are in a house', :options => {'up' => 'attic', 'down' => 'cellar'}  }
attic = {:name => 'attic', :description => 'You are in an attic', :options => {'down' => 'house'}  }
cellar = {:name => 'cellar', :description => 'You are in a cellar', :options => {'up' => 'house'}  }

zork = [house, attic, cellar]

$zork = Zork.new(zork)

get '/' do
  "<a href='/house'>Start Game</a>" 
end

get '/:place_name' do
  place = $zork.find_place(params[:place_name]) 
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

