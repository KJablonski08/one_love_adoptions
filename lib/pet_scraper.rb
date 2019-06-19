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
  
  def self.add_attributes(chosen_dog) 
    
    #each dog url page - individual url scraped in pet_scraper for each dog object
     doc = Nokogiri::HTML(open(chosen_dog.url))
    
    #scrape breed from individual pet page once (if none already assigned)
     chosen_dog.breed = doc.css("p.pet-breed").text.strip
  
    #scrape sex from individual pet page once (if none already assigned)
     chosen_dog.sex = doc.css("p.pet-sex").text.strip
     
    #scrape age from individual pet page once (if none already assigned)
     chosen_dog.age = doc.css("p.pet-age").text.strip
  
    #scrape weight from individual pet page once (if none already assigned)
    chosen_dog.weight = doc.css("p.pet-weight").text.strip 

    #scrape long description at bottom of the pet page once (if none already assigned)
    chosen_dog.description = doc.css("div.pet-desc p")[-1].text.strip
  end 
  
  
end 