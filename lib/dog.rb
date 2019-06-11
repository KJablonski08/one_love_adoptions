class Dog 
  
  attr_accessor :name, :breed, :age, :sex, :desc 
  
  @@all = []
  
  def initialize(name = nil, breed = nil, age = nil, sex = nil, desc = nil)
    @desc = desc 
    @name = name 
    @breed = breed 
    @age = age 
    @sex = sex 
    @@all << self 
  end 
  
  def self.all
    @@all
  end
  
end 