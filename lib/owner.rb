class Owner
  attr_accessor 
  attr_reader :name, :species
  
  @@all = []
  @@count = 0
  @@pets = {:cats => [], :dogs => []}

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
    @@count += 1
  end
  
  def say_species
    "I am a #{@species}."
  end
  
  def cats
   Cat.all.select {|cat| cat.owner == self} 
  end
  
  def dogs 
   Dog.all.select {|dog| dog.owner == self}
  end
  
  def buy_cat(cat_name)
    @@pets[:cats] << Cat.new(cat_name, self)
  end
  
  def buy_dog(dog_name)
    @@pets[:dogs] << Dog.new(dog_name, self)
  end
  
  def walk_dogs
    Dog.all.select {|dog| dog.mood = "happy"}
  end
  
  def feed_cats
    Cat.all.select {|cat| cat.mood = "happy"}
  end
  
  def sell_pets
    Dog.all.each do |dog| 
      dog.mood = "nervous"
      dog.owner = nil
    end
    Cat.all.each do |cat| 
      cat.mood = "nervous"
      cat.owner = nil
    end
  end
  
  def list_pets
    num_dogs = Dog.all.size
    num_cats = Cat.all.size
    return "I have #{num_dogs} dog(s), and #{num_cats} cat(s)."
  end
  
  def self.all
    @@all
  end
  
  def self.count
    @@count
  end
  
  def self.reset_all
    @@all = []
    @@count = 0
  end
  
  def self.pets
    @@pets
  end
  
end