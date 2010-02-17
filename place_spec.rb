require 'place'

describe Place do
  describe "filled in object" do
    before do
      @description = "some place"
      @place = Place.new(:description => @description)
    end
    it 'should have a description' do
      @place.description.should_not be_nil
    end
    it 'the description should be what was initialized' do
      @place.description.should == @description
    end
    it 'should have a list of links' do
      @place.links.should == {}
    end

  end

  describe "default values" do
    before do
      @place = Place.new
    end
    it 'should have a description' do
      @place.description.should_not be_nil
    end

    it 'should have a description' do
      @place.description.should == "the vastness of space"
    end
  end
end