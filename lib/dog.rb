class Dog 
  
  attr_accessor :name, :url
  
  @@all = []
  
  def initialize(name = nil, url = nil)
    @name = name 
    @url = url 
    @@all << self 
  end 
  
  def self.all
    @@all
  end
  
end 