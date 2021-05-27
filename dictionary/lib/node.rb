# Unit of @Dictionary
class Node
  attr_accessor :is_end, :Trie

  def initialize()
    @is_end = false
    @Trie = Array.new(26,nil)
  end
end