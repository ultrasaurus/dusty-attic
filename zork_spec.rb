require 'zork'
  
describe Zork do
  describe "empty world behavior" do
    before do
      @zork = Zork.new
    end

    it "should have no place" do
      @zork.find_place("house").should == nil
    end
  end

  describe "world with one place" do
    it 'should be able to display the description of a place' do
      house = {:name => 'house', :description => 'You are in a house', :options => {'up' => 'attic', 'down' => 'cellar'}  } 
      zork = [house]
      @zork = Zork.new(zork)
      place = @zork.find_place('house')
      place.name.should == "house"
      place.description.should == "You are in a house"
      place.links.should ==  {'up' => 'attic', 'down' => 'cellar'} 
    end
  end

  describe "world with several places" do
    it "should be able to find all places" do
      house = {:name => 'house', :description => 'You are in a house', :options => {'up' => 'attic', 'down' => 'cellar'}  } 
      attic = {:name => 'attic', :description => 'It is dusty and there are cobwebs here.', :options => {'down' => 'house'}  } 
      cellar = {:name => 'cellar', :description => 'It is pitch black. You are likely to be eaten by a grue.', :options =>  {}  }
      @zork = Zork.new([house,attic,cellar])
      @zork.find_place('house').name.should == "house"
      @zork.find_place('attic').name.should == "attic"
      @zork.find_place('cellar').name.should == "cellar"
    end
  end
end
