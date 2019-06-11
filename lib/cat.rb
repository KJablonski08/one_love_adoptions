class Cat 
  
  attr_accessor :name, :breed, :age, :sex, :desc
  
  @@all = []
  
  def initialize(name = nil, breed = nil, age = nil, sex = nil, desc = nil)
    @name = name 
    @breed = breed 
    @age = age 
    @sex = sex 
    @desc = desc 
    @@all << self 
  end 
  
  def self.all
    @@all
  end 
end 