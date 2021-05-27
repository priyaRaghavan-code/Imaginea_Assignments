require_relative './lib/dictionary'
require_relative './lib/node'

module DictionaryModule
  VERSION = 1
end

if __FILE__ == $0
  key = :hifi # Input

  string_words = ["hi","hind","hello","how","here","her","apple","App","application","bus","bush","burst","Appointed"]
  string_words_meaning = {:hi => "used as a friendly greeting or to attract attention", 
    :hind => "situated at the back; posterior", 
    :hello =>"used as a greeting or to begin a phone conversation" , 
    :how => "in what way or manner; by what means", 
    :here => "n, at, or to this place or position",
    :her => "used as the object of a verb or preposition to refer to a female person or animal previously mentioned or easily identified",
    :apple => "the round fruit of a tree of the rose family, which typically has thin green or red skin and crisp flesh",
    :app => "an application or application form",
    :application => "application form",
    :bus => "a large motor vehicle carrying passengers by road, typically one serving the public on a fixed route and for a fare",
    :bush => "a shrub or clump of shrubs with stems of moderate length",
    :burst => "a shrub or clump of shrubs with stems of moderate length",
    :appointed => " decided on beforehand; designated"}
  dictionary = DictionaryModule::Dictionary.new Node.new()

  string_words.each do |each_word|
    dictionary.insert_node(each_word.downcase)
  end

  # Check if the given key is present in the Hash, and print its value. Else, go to @Dictionary
  if string_words_meaning.key?(key)
    puts "The meaning for #{key} is: #{string_words_meaning[key]}"
  else
    puts "Do you mean?"
    dictionary.check_string_is_present(key.to_s)
  end
end
