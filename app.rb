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

get '/:place' do
  new_place_name = @params[:place]
  new_place_name
  $zork.go(new_place_name) unless new_place_name.nil? 
   doc = "<html><p>" +
   $zork.place.description +
   "</p>"
   links = $zork.place.links
   unless links.nil?
     links.each do |label,destination| 
       doc += "<li><a href=\'/#{destination}\'>#{label}</a></li>"
     end
   end
   doc += "</html>"
   doc
end

