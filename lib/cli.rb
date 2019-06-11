class CLI 
  
  def run
    DogScraper.scrape_dogs 
    CatScraper.scrape_cats
    
    #potential to refactor and sub a scraper class to scrape all pets at the same time? 
    
    self.greeting
    
  end 
  
  def greeting 
    puts "\nWelcome to One Love Pet Adoptions!\n\n"
  end 
  
  #def list_dogs 
  #end 
  
end 