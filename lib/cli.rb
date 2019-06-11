class CLI 
  
  def run
    self.greeting
    DogScraper.scrape_dogs 
    #self.list_dogs 
  end 
  
  def greeting 
    puts "\nWelcome to One Love Pet Adoptions!\n\n"
  end 
  
  #def list_dogs 
  #end 
  
end 