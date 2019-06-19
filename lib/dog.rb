class Dog 
  
  attr_accessor :name, :url, :breed, :sex, :age, :weight, :description 
  
  @@all = []
  
  def initialize(name = nil, url = nil)
    @name = name 
    @url = url 
    @@all << self 
  end 
  
  def self.all
    #reader for all array - display all dog objects 
    @@all
  end
  
  def self.find(index)
    #find chosen_dog using index number in all array 
    self.all[index-1]
  end

  def breed 
    @breed ||= Nokogiri::HTML(open(self.url)).css("p.pet-breed").text.strip
  end
 
end 