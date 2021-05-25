require 'trie'
class TrieNode
  attr_accessor :is_end
  TrieNode Trie[]
  def def initialize(is_end)
    @is_end = true
  end

  def TrieNode
    Trie = new TrieNode[256]
    0.upto(256) do |i|
      Trie[i] = nil
    end
    @is_end = false
  end
end

class Node
  def initialize()
  end

  def insert_node(TrieNode root, string)
    TrieNode temp = root
    0.downto(string.length) do |i|
      if temp.Trie[string[i]] == nil
        temp.Trie[string[i]] = TrieNode.new()
      end
      temp = temp.Trie[string[i]]
    end
    temp.@is_end = true
  end

  def print_suggested_words(TrieNode root,string)
    if root.@is_end == nil
      p result + " "
    end
    0.downto(256) do |i|
      if root.Trie[i] != nil
        result += i.chr 
        print_suggested_words(root.Trie[i], result)
        result = result[0..result.length-2]
      end
    end
  end

  def check_string_is_present(TrieNode root, key)
    0.downto(key.lenght) do |i|
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


end
# Json_array = { :A => ["apple", "app", "aple", "an", "aeroplane", "and", "alphabet", "again", "assure", "alone"], 
#                :B => ["banned", "banana", "buffalo", "bush", "bus", "band", "burst", "bull", "bind", "bound"],
#                :C => ["cat", "can", "cape", "carnivel", "carrot", "car", "cast", "cut", "cute", "cutest","curl"] }
# string_to_search = gets

string_words = ["hi", "hind","hello","how","here","her"]
key = "hifi"
TrieNode root = TrieNode.new()

string_words.each do |word|
  insert_node(root,word)
end

if check_string_is_present(root, key)
  p "yes " + key +" is present"
end


