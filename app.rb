require 'rubygems'
require 'sinatra'
require 'zork'

$zork = Zork.new("testdata/zork.yaml")

get '/' do
  
end

get '/:place' do
  new_place_name = @params[:place]

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

