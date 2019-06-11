class DogScraper
  
  BASE_URL = "https://riversidepet.com/adoptions/dogs/"
  
  def self.get_page 
    doc = Nokogiri::HTML(open(BASE_URL))
  end
  
  def self.scrape_dogs 
    dogs = []
    
    #url will return an array of urls for each dog from dogs adoption page 
    #each_dog will iterate over each url to get info we need for each dog 
    
    url = get_page.css("div.pet-loop-box a").map {|a| a["href"]}
    each_dog = url.map {|a| Nokogiri::HTML(open(a))}
    each_dog.map do |pet|
      dog = Dog.new
      dog.name = pet.css("h2.pet-name").text 
      dog.breed = pet.css("p.pet-breed").text 
      dog.age = pet.css("p.pet-age").text 
      dog.sex = pet.css("p.pet-sex").text 
      dog.desc = pet.css("div.pet-desc p strong")[-1].text
      
      dogs << {:name => dog.name, :breed => dog.breed, :age => dog.age, :sex => dog.sex, :desc => dog.desc}
    end 
    dogs 
    binding.pry 
  end 
  
end 
