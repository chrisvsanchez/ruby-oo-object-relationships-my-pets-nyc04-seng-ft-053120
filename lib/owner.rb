require 'pry'
class Owner
  # code goes here
  attr_reader :name, :species

@@all = []

  def initialize(name, species = "human")
    @name = name
    @species = species
    @@all << self
  end 

  def say_species 
    p "I am a #{self.species}."
  end

  def self.all 
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all = []
  end

  def cats 
    Cat.all.select{|cat| cat.owner == self}
    # binding.pry
  end

  def dogs
     Dog.all.select{|dog| dog.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.select{|dog| dog.mood = "happy"}
  end
  
  def feed_cats 
  Cat.all.select{|cat| cat.mood = "happy"}
  end

  def sell_pets
    dogs.select{|dog| dog.mood = "nervous" 
    dog.owner = nil}
    cats.select{|cat| cat.mood = "nervous" 
    cat.owner = nil}
  end

    def list_pets
      # binding.pry
      self.buy_cat(name)
      self.buy_dog(name)
      p "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
    end
end