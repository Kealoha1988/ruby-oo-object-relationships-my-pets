class Owner
  # code goes here
  attr_reader :name, :species, :mood

  @@all = []
  @@count = 0
  @@pets = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
    @@count = @@count + 1
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all = []
    @@count = 0
  end

  def self.count
    @@count
  end

  def cats
    Cat.all.select{|cats| cats.owner == self}
  end

  def dogs
    Dog.all.select{|dog| dog.owner == self}
  end

  def buy_cat(pet)
    Cat.new(pet, self)
  end

  def buy_dog(pet)
    Dog.new(pet, self)
  end

  def walk_dogs
    self.dogs.each{|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.each{|cat| cat.mood = "happy"}
  end

  def sell_pets
    self.dogs.each{|dog| dog.mood = "nervous"}
    self.cats.each{|cat| cat.mood = "nervous"}
    self.dogs.each{|dog| dog.owner = nil}
    self.cats.each{|cat| cat.owner = nil}
  end

  def list_pets
    "I have #{self.dogs.length} dog(s), and #{self.cats.length} cat(s)."
  end


end