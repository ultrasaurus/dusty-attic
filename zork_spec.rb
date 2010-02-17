require 'zork'

describe Zork do
  describe "empty world behavior" do
    before do
      @zork = Zork.new
    end
    it 'should have a starting place' do
        @zork.place.should_not be_nil
    end

    it 'should allow you to go to another place' do
      @house = Place.new(:description => "you are in a house")
      @loft = Place.new(:description => "the loft is light and airy")
      @firehouse = Place.new(:description => "there is a firepole and a hole in the ceiling")
      @tunnel = Place.new(:description => "the tunnel is dark")
      @house.links = {"go north" => @firehouse,
                      "go west" => @loft,
                      "go south" => @tunnel}

      @zork.place = @house
      @zork.follow("go north").should == @firehouse
    end
  end
  describe "loading a map" do
    it 'should load a map at startup' do
      @zork = Zork.new('testdata/zork.yaml')
      @zork.place.name.should == "house"
    end
  end
end