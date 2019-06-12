class CLI 
  
  def run
    PetScraper.make_dogs 
    PetScraper.make_cats 
    
    #potential to refactor and sub a scraper class to scrape all pets at the same time? 
    
    self.greeting
    
  end 
  
  def greeting 
    puts "\nWelcome to One Love Pet Adoptions!\n\n"
  end 
  
  #def list_dogs 
  #end 
  
end 