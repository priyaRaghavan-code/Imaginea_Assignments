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

string_words = ["hi","hind","hello","how","here","her", "google","apple","App","application","bus","bush","burst","Appointed"]
key = "appointed"
root = Node.new()

string_words.each do |word|
  insert_node(root,word.downcase)
end

# print_suggested_words(root,key)
if check_string_is_present(root, key.downcase)
 p  key +" is present"
end

