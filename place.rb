class Place
  attr_accessor :name, :description, :links

  def initialize(options ={})
    @description = options[:description]
    @description = "the vastness of space" if @description.nil?
    @name = options[:name]
    @name = "empty place" if @name.nil?
    @links = {}
  end

end