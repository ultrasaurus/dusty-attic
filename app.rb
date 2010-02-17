require 'sinatra'
require 'zork'

#put this on Heroku

$zork = Zork.new("testdata/zork.yaml")
get '/:link' do
  unless link.nil?
    @zork.follow(link)
  end
  p = $zork.place
  "<html><p>#{p.description }</p>" +
  "<ul>"
  "<li><a href='"
  "</html>"
end