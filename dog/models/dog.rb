class Dog
  attr_accessor :name
  attr_reader :hunger

  def hunger=(hunger)
    @hunger = hunger if hunger.class == Fixnum
  end

  def eat
    self.hunger -= 1 if self.hunger > 0
  end


end

