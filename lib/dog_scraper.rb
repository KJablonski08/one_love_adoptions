class DogScraper
  
  BASE_URL = "https://riversidepet.com/adoptions/dogs/"
  
  def self.get_page 
    doc = Nokogiri::HTML(open(BASE_URL))
  end
  
  def self.scrape_dogs 
    get_page.css("div.pet-loop-box a").map {|a| a["href"]}
  end 
  
  def self.make_dogs 
    dogs = []
    each_url = scrape_dogs.map {|a| Nokogiri::HTML(open(a))}
    each_url.map do |pet|
      dog = Dog.new
      dog.name = pet.css("h2.pet-name").text 
      dog.breed = pet.css("p.pet-breed").text 
      dog.age = pet.css("p.pet-age").text 
      dog.sex = pet.css("p.pet-sex").text 
      dog.desc = pet.css("div.pet-desc p strong")[-1].text
      
      dogs << {:name => dog.name, :breed => dog.breed, :age => dog.age, :sex => dog.sex, :desc => dog.desc}
    end 
    dogs 
  end 
  
end 
