class PetScraper
  
  CAT_URL = 'https://riversidepet.com/adoptions/cats/'
  DOG_URL = "https://riversidepet.com/adoptions/dogs/"
  
  def self.get_dog_page 
    doc = Nokogiri::HTML(open(DOG_URL))
  end
  
  def self.get_cat_page 
    doc = Nokogiri::HTML(open(CAT_URL))
  end
  
  def self.make_dogs 
    #makes a new dog object for each pet loop box - initialized with name and url 
    get_dog_page.css("div.pet-loop-box").each do |pet|
      dog = Dog.new 
      dog.name = pet.css("h3.pet-title").text 
      dog.url = pet.css("a").first["href"]
    end 
  end 
  
  def self.make_cats  
    #makes a new dog object for each pet loop box - initialized with name and url
    get_cat_page.css("div.pet-loop-box").each do |pet|
      cat = Cat.new 
      cat.name = pet.css("h3.pet-title").text 
      cat.url = pet.css("a").first["href"]
    end 
  end 
  
  def self.make_pets 
    self.make_cats
    self.make_dogs
  end 
  
end 