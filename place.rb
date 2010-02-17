class Place
  attr_accessor :description, :links

  def initialize(options={:description => "the vastness of space"})
    @description = options[:description]
    @links = {}
  end

end