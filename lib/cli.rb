class CLI 
  
  def run
    PetScraper.make_pets 
    self.greeting
    self.dog_or_cat 
    self.menu 
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
      breed = cat.breed 
      puts "#{index}. #{name} | #{breed} | #{url}\n"
    end
    cat_selection
  end 
  
  def list_dogs
    puts "\nHere is a list of dogs available for adoption:\n\n"
    dogs = Dog.all
    dogs.each.with_index(1) do |dog, index|
      name = dog.name 
      breed = dog.breed 
      url = dog.url
      puts "#{index}. #{name} | #{breed} | #{url}\n"
    end
    dog_selection
  end 
  
  def cat_selection
    puts "\nWhich pet would you like more information on?:\n"
    input = gets.strip.to_i
    chosen_cat = Cat.find(input)
    print_chosen_cat(chosen_cat)
  end 
  
  def dog_selection
    puts "\nWhich pet would you like to get to know better?:\n"
    input = gets.strip.to_i
    chosen_dog = Dog.find(input)
    print_chosen_dog(chosen_dog)
  end 
  
  def print_chosen_dog(chosen_dog)
    puts "\nName:  #{chosen_dog.name}"
    puts "Breed:  #{chosen_dog.breed}" 
    puts "Sex: #{chosen_dog.sex}"
    puts "Age:  #{chosen_dog.age}"
    puts "Weight:  #{chosen_dog.weight}"
    #puts "Additional Notes:\n#{chosen_dog.desc}"
  end 
  
  def print_chosen_cat(chosen_cat)
    puts "\nName:  #{chosen_cat.name}"
    puts "Breed:  #{chosen_cat.breed}" 
    puts "Sex: #{chosen_cat.sex}"
    puts "Age:  #{chosen_cat.age}"
    puts "Weight:  #{chosen_cat.weight}"
    #puts "Additional Notes:\n#{chosen_dog.desc}"
  end 
  
  def menu 
    puts "\nWould you like to see another pet?\n"
    
    input = gets.strip.downcase  
      if input == "yes"
        dog_or_cat
      elsif input == "no"
        puts "\nThank you for visiting!\n"
        exit 
      else 
        puts "\nI don't understand your selection.\n"
        menu 
      end 
    menu 
  end 
  
end 