require './lib/node.rb'
require './lib/dictionary.rb'
require './dictionary_main.rb'
require 'rspec'

RSpec.describe DictionaryModule do
  let(:dict) { DictionaryModule::Dictionary.new Node.new }
  describe DictionaryModule::Dictionary do
    context "#insert_node"
      it "given #{""} to insert, returns false" do
        expect(dict.insert_node("")).to eq(false)
      end

      it "given hi string to insert, returns true" do
        test_map = {"a"=>0, "e"=>4, "l"=>11, "p"=>15}
        expect(dict.insert_node("apple")).to eq(test_map) 
      end

      it "given HELLO string to insert, returns true" do
        test_map =  {"a"=>0, "c"=>2, "e"=>4, "i"=>8, "m"=>12, "r"=>17}
        expect(dict.insert_node("Icecream")).to eq(test_map) 
      end

      it "given heLLO string to insert, returns true" do
        test_map = {"e"=>4, "h"=>7, "l"=>11, "o"=>14}
        expect(dict.insert_node("heLLO")).to eq(test_map)
      end

      it "given hi,hind to insert" do
        dict.insert_node("hi")
        dict.insert_node("hind")
        word_map_one = {"h"=>0, "i"=>1} #hi
        #word_map_two = {"a"=>0, "s"=>1, "h"=>2, "i"=>3} #ashi
        word_map_two = {"h" =>0, "i"=>1, "n"=>2, "d"=>3}
        final_map = {"h"=>0, "i"=>1}
        final_map.each do |key,value|
            if word_map_one[key] == word_map_two[key]
              expect(true).to eq(true)
            else
              p "inside false"
              expect(false).to eq(false)  
            end
        end
      end
    
      it "given nil to insert, returns false" do
        expect(dict.insert_node(nil)).to eq(false) 
      end

      it "given special character string to insert, returns false" do
        expect(dict.insert_node("abd234@#%ad")).to eq(false) 
      end

      it "given non-string value to insert, returns false" do
        expect(dict.insert_node(123)).to eq(false) 
      end
    end

    context "#get_suggested string" do
      it "given hi to search, returns nil" do
        dict.insert_node("hi")
        expect(dict.get_suggested_string("hi")).to eq(nil)
      end

      it "given apple to search, returns nil" do
        dict.insert_node("hind")
        expect(dict.get_suggested_string("apple")).to eq(nil) 
      end

      it "given hifi to search in the trie, returns an array of suggested words" do
        dict.insert_node("hi")
        dict.insert_node("hind")
        dict.insert_node("hello")
        expect(dict.get_suggested_string("hifi")).to eq(["hi","hind"])
      end

      it "given special character #$%@!@ to search, returns nil" do
        expect(dict.get_suggested_string("#$%@!@")).to eq(nil)
      end

      it "given the number 12334 to search, returns nil" do
        expect(dict.get_suggested_string("12334")).to eq(nil)
      end

      it "given non string value 1234 to search, returns nil" do
        expect(dict.get_suggested_string(12434)).to eq(nil)
      end

      it "given #{""} to search, returns nil" do
        expect(dict.get_suggested_string(" ")).to eq(nil)
      end

      it "given nil to search, returns nil" do
        expect(dict.get_suggested_string(nil)).to eq(nil)
      end

      it "given hi fi\n to search, returns an array of suggested words" do
        dict.insert_node("hi")
        dict.insert_node("hind")
        dict.insert_node("hello")
        expect(dict.get_suggested_string("hi fi\n")).to eq(["hi","hind"])
      end

      it "given bye\t to search, returns an array of suggested words" do
        dict.insert_node("banana")
        dict.insert_node("bat")
        dict.insert_node("buffalo")
        expect(dict.get_suggested_string("bye\t")).to eq(["banana","bat","buffalo"])
      end

      it "given Appolo to search, returns an array of suggested words" do
        dict.insert_node("apple")
        dict.insert_node("app")
        dict.insert_node("application")
        expect(dict.get_suggested_string("Appolo")).to eq(["app","apple","application"])
      end

    end
  end

  describe Node do
    let(:node) {Node.new()}
    context "#initialize" do
      it "initializes the trie tree end to be false" do
        expect(node.Trie).to eq([nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil])
      end

      it "initialize the trie tree end to be false" do
        expect(node.is_end).to eq(false)
      end
    end
  end

 