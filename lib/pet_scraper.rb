class PetScraper
  
  CAT_URL = 'https://riversidepet.com/adoptions/cats/'
  DOG_URL = "https://riversidepet.com/adoptions/dogs/"
  
  
  def self.get_dog_page 
    #gets base page with available dog titles (names) and URL info
    doc = Nokogiri::HTML(open(DOG_URL))
  end
  
  def self.get_cat_page 
    #gets base page with available cat titles (names) and URL info
    doc = Nokogiri::HTML(open(CAT_URL))
  end
  
  def self.make_dogs 
    #makes a new dog object for each pet-loop-box (container) - initialized with name and url 
    get_dog_page.css("div.pet-loop-box").each do |pet|
      dog = Dog.new 
      dog.name = pet.css("h3.pet-title").text 
      dog.url = pet.css("a").first["href"]
    end 
  end 
  
  def self.make_cats  
    #makes a new dog object for each pet-loop-box (container) - initialized with name and url
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
  
  def self.add_dog_attributes(chosen_dog) 
    
     doc = Nokogiri::HTML(open(chosen_dog.url))
     chosen_dog.breed = doc.css("p.pet-breed").text.strip
     chosen_dog.sex = doc.css("p.pet-sex").text.strip
     chosen_dog.age = doc.css("p.pet-age").text.strip
     chosen_dog.weight = doc.css("p.pet-weight").text.strip 
     chosen_dog.description = doc.css("div.pet-desc p")[-1].text.strip
  end 
  
  def self.add_cat_attributes(chosen_cat) 
    
    doc = Nokogiri::HTML(open(chosen_cat.url))
    chosen_cat.breed = doc.css("p.pet-breed").text.strip
    chosen_cat.sex = doc.css("p.pet-sex").text.strip
    chosen_cat.age = doc.css("p.pet-age").text.strip
    chosen_cat.weight = doc.css("p.pet-weight").text.strip 
    chosen_cat.description = doc.css("div.pet-desc p")[-1].text.strip
    
  end 
  
end 