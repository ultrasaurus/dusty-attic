require 'world'
  
describe World do
  describe "empty world behavior" do
    before do
      @world = World.new
    end

    it "should have no place" do
      @world.find_place("house").should == nil
    end
  end

  describe "world with one place" do
    it 'should be able to display the description of a place' do
      house = {:name => 'house', :description => 'You are in a house', :options => {'up' => 'attic', 'down' => 'cellar'}  } 
      world = [house]
      @world = World.new(world)
      place = @world.find_place('house')
      place.name.should == "house"
      place.description.should == "You are in a house"
      place.links.should ==  {'up' => 'attic', 'down' => 'cellar'} 
    end
  end

  describe "world with several places" do
    it "should be able to find all places" do
      house = {:name => 'house', :description => 'You are in a house', :options => {'up' => 'attic', 'down' => 'cellar'}  } 
      attic = {:name => 'attic', :description => 'It is dusty in this attic.', :options => {'down' => 'house'}  } 
      cellar = {:name => 'cellar', :description => 'It is dark here.', :options =>  {}  }
      @world = World.new([house,attic,cellar])
      @world.find_place('house').name.should == "house"
      @world.find_place('attic').name.should == "attic"
      @world.find_place('cellar').name.should == "cellar"
    end
  end
end
