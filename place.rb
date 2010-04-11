class Place
  attr_accessor :name, :description, :links

  def initialize(name=nil, description=nil, options ={})
    @description = description
    @description = "the vastness of space" if @description.nil?
    @name = name
    @name = "empty place" if @name.nil?
    @links = options
  end

end