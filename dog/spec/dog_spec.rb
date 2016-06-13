require_relative "../models/dog"

describe Dog do
  subject(:dog) { Dog.new }  # set up variables or DB connection

  before do    # set state (not variables)
    dog.hunger = 9
  end

  describe "::new" do  # two colons set up _class_ method
    it "initialize a new dog" do
      expect(dog).to be_a(Dog)   
    end
  end

  describe "#name" do  # a pound sign setups up an instance method
    it "allows the reading and writing of a name" do 
      dog.name = "Fido"
      expect(dog.name).to eq("Fido")
    end
  end

  describe "#hunger" do  # a pound sign setups up an instance method
    it "allows the reading and writing of a hunger level" do 
      expect(dog.hunger).to eq(9)
    end
    it "represents the hunger level using an integer" do 
      expect(dog.hunger).to be_a(Integer)
    end
    it "only changes if passed an integer, not a string" do 
      dog.hunger = "7"
      expect(dog.hunger).to be(9)
    end
  end

  describe "#eat" do
    context "when the dog is hungry" do
      it "decrements the hunger level when invoked" do
        dog.eat
        expect(dog.hunger).to eq(8)
      end
    end
    context "when the dog is full" do
      it "doesn't decrement the hunger level when invoked" do
        dog.hunger = 0
        dog.eat
        expect(dog.hunger).to eq(0)
      end
    end
  end

end