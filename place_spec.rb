require 'place'

describe Place do
  describe "filled in object" do
    before do
      @name = "my place"
      @description = "my very nice place"
      @options = {'up' => 'another place'}
      @place = Place.new(@name, @description, @options)
    end
    it 'should have a name' do
      @place.name.should_not be_nil
      @place.name.should == @name
    end
    it 'should have a description' do
      @place.description.should_not be_nil
    end
    it 'the description should be what was initialized' do
      @place.description.should == @description
    end
    it 'should have a list of links' do
      @place.links.should == {'up' => 'another place'}
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
    it 'should have a name' do
      @place.name.should == "empty place"
    end
  end
end