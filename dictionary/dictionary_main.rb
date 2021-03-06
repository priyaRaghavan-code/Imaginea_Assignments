require_relative './lib/dictionary'
require_relative './lib/node'

module DictionaryModule
  VERSION = 1
end

if __FILE__ == $0
  key = "hifi" # Input

  string_words_meaning = 
  {
    "hi" => "used as a friendly greeting or to attract attention", 
    "hind" => "situated at the back; posterior", 
    "hello" =>"used as a greeting or to begin a phone conversation" , 
    "how" => "in what way or manner; by what means", 
    "here" => "n, at, or to this place or position",
    "her" => "used as the object of a verb or preposition to refer to a female person or animal previously mentioned or easily identified",
    "apple" => "the round fruit of a tree of the rose family, which typically has thin green or red skin and crisp flesh",
    "app" => "an application or application form",
    "application" => "application form",
    "bus" => "a large motor vehicle carrying passengers by road, typically one serving the public on a fixed route and for a fare",
    "bush" => "a shrub or clump of shrubs with stems of moderate length",
    "burst" => "burn out",
    "appointed" => " decided on beforehand; designated",
    "cat" => "a pet",
    "dog" => "a pet or animal",
    "elephant" => "animal",
    "fan" => "which gives air",
    "grandma" => "maternal mother",
    "idle" => "free",
    "jug" => "which is used to store something",
    "king" => "who rules the area",
    "lion" => "king of forest",
    "monkey" => "Animal",
    "nose" => "part of the body",
    "onion" => "vegetable",
    "pot" => "which is used to store water",
    "queue" => "in line",
    "rabbit" => "animal",
    "soft" => "pluffy",
    "tiger" => "animal",
    "union" =>"joined or united",
    "verbose" => "lengthy",
    "water" => "liquid thing",
    "xerox" => "hardcopy of the document",
    "yellow" => "color",
    "zoo" => "The place which has many animals",
    "a" => "vowel"
  }
  dictionary = DictionaryModule::Dictionary.new Node.new()

  string_words_meaning.each do |word,meaning|
    if word.scan(/[!@#$%^&*()_+{}\[\]:;'"\/\\?><.,[0-9]]/).empty?
      dictionary.insert_node(word.downcase)
    else
      puts "#{word} is not valid string to insert"
    end
  end

  # Check if the given key is present in the Hash, and print its value. Else, go to @Dictionary
  if key.scan(/[!@#$%^&*()_+{}\[\]:;'"\/\\?><.,[0-9]]/).empty?
    if string_words_meaning.key?(key)
      puts "The meaning for #{key} is: #{string_words_meaning[key]}"
    else
      result = dictionary.get_suggested_string(key)
      if result != nil
        puts "Do you mean?"
        puts result
      else
        puts "Enter Correct string to search"
      end

    end
  else
    puts "Enter correct string to search"
  end
  
end

