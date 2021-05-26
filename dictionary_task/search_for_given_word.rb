class Node
  attr_accessor :is_end,:Trie
  def initialize()
    @is_end = false
    @Trie = Array.new(26,nil)
  end
end

def insert_node(root,word)
  for i in 0..word.length - 1
    if word[i] != nil && root.Trie[word[i].ord - 97] == nil
      root.Trie[word[i].ord - 97] = Node.new()
    end
    root = root.Trie[word[i].ord - 97]
  end
  root.is_end = true
end

def print_suggested_words(root, result)
  if root.is_end == true
    puts "Do you mean? " + result
  end
  for i in 0..26 - 1
    if root.Trie[i] != nil
      result += (i+97).chr 
      print_suggested_words(root.Trie[i], result)
      result = result[0..result.length-2]
    end
  end
end

def check_string_is_present(root, key)
  for i in 0..key.length - 1
    if root.Trie[key[i].ord - 97] == nil
      print_suggested_words(root, key[0..i - 1])
      return false
    end
    root = root.Trie[key[i].ord - 97]
  end
  if root.is_end == true
    return true
  else
    print_suggested_words(root, key)
  end
  return false
end

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
key = "hi"
root = Node.new()

string_words.each do |word|
  insert_node(root,word.downcase)
end

# print_suggested_words(root,key)
# if check_string_is_present(root, key.downcase)
#  p  key +" is present"if check_string_is_present(root, key.downcase)
if check_string_is_present(root, key.downcase)
  string_words_meaning.each do |k, v|
    if "#{k}" == key.downcase
      p "#{k}: #{v}"
    end
  end
end
