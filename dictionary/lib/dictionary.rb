require 'rspec'
module  DictionaryModule
  class Dictionary
    ASCII = 97
    def initialize(root_node)
      @root = root_node
    end

    # Inserts given word to the @Trie
    # @params: String word
    # @return: boolean
    def insert_node(word)
      temp = root
      hash_map = {}
      if word.class == String && word != "" && word != nil && word.scan(/[!@#$%^&*()_+{}\[\]:;'"\/\\?><.,[0-9]]/).empty?
        word = word.downcase
        0.upto(word.length - 1) do |i|
          ascii_value = word[i].ord - ASCII
          if temp.Trie[ascii_value] == nil
            temp.Trie[ascii_value] = Node.new()
          end
          temp = temp.Trie[ascii_value]
          hash_map[word[i]] = ascii_value
        end
        temp.is_end = true
        return hash_map
      else
        return false
      end
    end
    
    # Gets the most suitable word Prefix from the @Trie
    # @params: TrieNode temp, String result
    # @returns: Array arr
    def suggested_string_helper(temp, result, arr)
      if temp.is_end == true
        arr.push(result)
      end
      0.upto(26 - 1) do |i|
        if temp.Trie[i] != nil
          result += (i+ASCII).chr 
          suggested_string_helper(temp.Trie[i], result, arr)
          result = result[0..result.length-2]
        end
      end
      return arr
    end
    
    # Calls @print_suggested_words if @key is not present in the Trie, return Array of suggested Words. Else returns nil 
    # @params: String key
    # @returns: Array result or nil
    def get_suggested_string(key)
      temp = root
      if key != "" && key != nil && temp.Trie[key[0].ord - ASCII] == nil && temp.Trie[(key[0].ord+32) - ASCII] == nil
        return nil
      else
        if key.class == String && key != "" && key != nil 
          0.upto(key.length - 1) do |i|
            key =key.downcase
            if temp.Trie[key[i].ord - ASCII] == nil
              result = suggested_string_helper(temp, key[0..i - 1], [])
              return result
            end
            temp = temp.Trie[key[i].ord - ASCII]
          end
        end
        if temp.is_end == true
          return nil
        end
      end  
    end
    # Access Modifier
    private
    def root
      @root
    end
  end
end 