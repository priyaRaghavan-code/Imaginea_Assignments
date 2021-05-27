require './lib/node.rb'
require './lib/dictionary.rb'
require './dictionary_main.rb'
require 'rspec'

describe DictionaryModule::Dictionary.new Node.new do
  describe ".insert_node" do
    context "insert a correct node" do
      it "the node should be inserted" do
        expect(subject.insert_node("priya")).to eq(true)
      end
    end
    
  end
  
  describe  ".check_string_is_present" do
    context "given empty string to search" do
      it "returns nil" do
        expect(subject.check_string_is_present("bhuvana")).to eq(false)
      end
    end

    context "given numbers to search" do
      it "returns error message" do
        expect(subject.check_string_is_present("1234")).to eq(false)
      end
    end

    context "given empty string to search" do
      it "returns nil" do
        expect(subject.check_string_is_present("")).to eq(false)
      end 
    end

    context "given the string in the trie" do
      it "given valid string to search" do
        expect(subject.check_string_is_present("grandma")).to eq(false)
      end
    end

  end
end
 