class CatScraper
  
  BASE_URL = 'https://riversidepet.com/adoptions/cats/'

  def self.get_page 
    doc = Nokogiri::HTML(open(BASE_URL))
  end
  
  def self.scrape_cats
    cats = []
    
    #url will return an array of urls for each cat from cats adoption page 
    #each_cat will iterate over each url to get info we need for each cat 
    
    url = get_page.css("div.pet-loop-box a").map {|a| a["href"]}
    each_cat = url.map {|a| Nokogiri::HTML(open(a))}
    each_cat.map do |pet|
      cat = Cat.new
      cat.name = pet.css("h2.pet-name").text 
      cat.breed = pet.css("p.pet-breed").text 
      cat.age = pet.css("p.pet-age").text 
      cat.sex = pet.css("p.pet-sex").text 
      cat.desc = pet.css("div.pet-desc p strong")[-1].text
      
      cats << {:name => cat.name, :breed => cat.breed, :age => cat.age, :sex => cat.sex, :desc =>cat.desc}
    end 
    cats  
    binding.pry
  end 
  
end 