require 'trie'
class TrieNode
  attr_accessor :is_end,:Trie
  def initialize()
    @is_end = false
    @Trie = Array.new(256,nil)
  end
end

def insert_node(root, string)
   temp = root
   for i in 0..string.length
    if temp.Trie[string[i]] == nil
       temp.Trie[string[i]] = TrieNode.new()
    end
   temp = temp.Trie[string[i]
   end
   temp.is_end = true
end

  def print_suggested_words(root,result)
    if root.is_end == true
      puts result + " " + "Inside"
    end
    for i in 0..256 do
   # 0.downto(256) do |i|
      if root.Trie[i] != nil
        result += i.chr 
        print_suggested_words(root.Trie[i], result)
        result = result[0..result.length-2]
      end
    end
  end

  def check_string_is_present(root, key)
    for i in 0..key.length
    #  0.downto(key.length) do |i|
      if root.Trie[key[i]] == nil
        print_suggested_words(root, key[0..i])
      end
      root = root.Trie[key[i]]
    end
    if root.is_end == true
      return true
    else
      print_suggested_words(root, key)
    end
    return false
  end
  
# Json_array = { :A => ["apple", "app", "aple", "an", "aeroplane", "and", "alphabet", "again", "assure", "alone"], 
#                :B => ["banned", "banana", "buffalo", "bush", "bus", "band", "burst", "bull", "bind", "bound"],
#                :C => ["cat", "can", "cape", "carnivel", "carrot", "car", "cast", "cut", "cute", "cutest","curl"] }
# string_to_search = gets

string_words = ["hi", "hind","hello","how","here","her"]
key = "hifi"
root = TrieNode.new()

string_words.each do |word|
  insert_node(root,word)
  p root
end


print_suggested_words(root,key)
#if check_string_is_present(root, key)
 # p "yes " + key +" is present"
#end

