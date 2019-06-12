class CLI 
  
  def run
    PetScraper.make_pets 
    self.greeting
    self.dog_or_cat 
    
  end 
  
  def greeting 
    puts "\nWelcome to One Love Pet Adoptions!\n"
    puts "\nOne Love is an adoption center in Scottsville NY dedicated to placing homeless\npets with loving families. These dogs and cats come to us from overcrowded\nshelters across the country as part of an effort to reduce the 1.5 million pets that are euthanized in shelters every year in this country.\n\n"
  end 
  
  def dog_or_cat 
    puts "\nWould you like to view cats or dogs?"
    puts "(type 'cats' or 'dogs')\n"
    input = gets.strip.downcase 
      if input == "cats"
        list_cats 
      elsif input == "dogs" 
        list_dogs 
      else 
        puts "\nI don't understand your selection.\n"
        dog_or_cat
      end 
  end 
    
  def list_cats 
    puts "\nHere is a list of cats available for adoption:\n\n"
    cats = Cat.all
    cats.each.with_index(1) do |cat, index|
      name = cat.name 
      url = cat.url
      puts "#{index}. #{name} | #{url}\n"
    end
  end 
  
  def list_dogs
    puts "\nHere is a list of dogs available for adoption:\n\n"
    dogs = Dog.all
    dogs.each.with_index(1) do |dog, index|
      name = dog.name 
      url = dog.url
      puts "#{index}. #{name} | #{url}\n"
    end
  end 
  
  def menu 
  end 
  
end 