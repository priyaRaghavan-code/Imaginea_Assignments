require_relative './lib/dictionary'
require_relative './lib/node'

module DictionaryModule
  VERSION = 1
end

if __FILE__ == $0
  key = "hi" # Input

  string_words = ["hi","hind","hello","how","here","her","apple","App","application","bus","bush","burst","Appointed","cat","dog","elephant","fan",
                   "grandma","idle","jug","king","lion","monkey","nose","onion","pot","queue","rabbit","soft","tiger","union","verbose","water","water",
                  "xerox","yellow","zoo","a"]
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

  string_words.each do |each_word|
    if each_word.scan(/[!@#$%^&*()_+{}\[\]:;'"\/\\?><.,[0-9]]/).empty?
      dictionary.insert_node(each_word.downcase)
    else
      puts "#{each_word} is not valid string to insert"
    end

  end

  # Check if the given key is present in the Hash, and print its value. Else, go to @Dictionary
  if key.scan(/[!@#$%^&*()_+{}\[\]:;'"\/\\?><.,[0-9]]/).empty?
    if string_words_meaning.key?(key)
      puts "The meaning for #{key} is: #{string_words_meaning[key]}"
    else
      puts "Do you mean?"
      dictionary.check_string_is_present(key)
    end
  else
    puts "Enter correct string to search"
  end
  
end

