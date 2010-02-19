=begin
require 'rubygems'
require 'sinatra'
require 'zork'

#put this on Heroku

$zork = Zork.new("testdata/zork.yaml")

get '/' do
  "<html><p>#{p.description }</p></html>"  
end
=end


  # myapp.rb
  require 'rubygems'
  require 'sinatra'
  require 'zork'

  $zork = Zork.new("testdata/zork.yaml")

  get '/' do
    $zork.place.description
  end

=begin

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
=end
