module  DictionaryModule
  class Dictionary
    ASCII = 97
    def initialize(root_node)
      @root = root_node
    end

    # Inserts given word to the @Trie
    # @params: String word
    # @return: null
    def insert_node(word)
      temp = root
      0.upto(word.length - 1) do |i|
        ascii_value = word[i].ord - ASCII
        if temp.Trie[ascii_value] == nil
          temp.Trie[ascii_value] = Node.new()
        end
        temp = temp.Trie[ascii_value]
      end
      temp.is_end = true
    end
    
    # Prints the most suitable word Prefix from the @Trie
    # @params: TrieNode temp, String result
    # @returns: null
    def print_suggested_words(temp, result)
      if temp.is_end == true
        puts result
      end
      0.upto(26 - 1) do |i|
        if temp.Trie[i] != nil
          result += (i+ASCII).chr 
          print_suggested_words(temp.Trie[i], result)
          result = result[0..result.length-2]
        end
      end
    end
    
    # Returns if the given key is present. Else, call @print_suggested_words
    # @params: String key
    # @returns: boolean
    def check_string_is_present(key)
      temp = root
      0.upto(key.length - 1) do |i|
        if temp.Trie[key[i].ord - ASCII] == nil
          print_suggested_words(temp, key[0..i - 1])
          return false
        end
        temp = temp.Trie[key[i].ord - ASCII]
      end
      if temp.is_end == true
        return true
      end
      print_suggested_words(temp, key)
      return false
    end

    # Access Modifier
    private
    def root
      @root
    end
  end
end 