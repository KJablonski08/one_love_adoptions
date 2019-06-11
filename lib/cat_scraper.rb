class CatScraper
  
  BASE_URL = 'https://riversidepet.com/adoptions/cats/'

  def self.get_page 
    doc = Nokogiri::HTML(open(BASE_URL))
  end
  
  def self.scrape_cats
     get_page.css("div.pet-loop-box a").map {|a| a["href"]}
  end 
  
  def self.make_cats 
    cats = []
    each_url = scrape_cats.map {|a| Nokogiri::HTML(open(a))}
    each_url.map do |pet|
      cat = Cat.new
      cat.name = pet.css("h2.pet-name").text 
      cat.breed = pet.css("p.pet-breed").text 
      cat.age = pet.css("p.pet-age").text 
      cat.sex = pet.css("p.pet-sex").text 
      cat.desc = pet.css("div.pet-desc p strong")[-1].text
      
      cats << {:name => cat.name, :breed => cat.breed, :age => cat.age, :sex => cat.sex, :desc =>cat.desc}
    end 
    cats  
  end 
  
end 