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
  
  def doc
    #each dog url page - individual url scraped in pet_scraper for each dog object
     Nokogiri::HTML(open(self.url))
  end
  
  def breed 
    #scrape breed from individual pet page once (if none already assigned)
    @breed ||= doc.css("p.pet-breed").text.strip
  end
  
  def sex 
    #scrape sex from individual pet page once (if none already assigned)
    @sex ||= doc.css("p.pet-sex").text.strip
  end 
  
  def age 
    #scrape age from individual pet page once (if none already assigned)
    @age ||= doc.css("p.pet-age").text.strip
  end 
  
  def weight 
    #scrape weight from individual pet page once (if none already assigned)
    @weight ||= doc.css("p.pet-weight").text.strip 
  end 
  
  def description 
    #scrape long description at bottom of the pet page once (if none already assigned)
    @description ||= doc.css("div.pet-desc p")[-1].text.strip
  end 
  
end 