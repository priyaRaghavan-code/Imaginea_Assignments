require './lib/node.rb'
require './lib/dictionary.rb'
require './dictionary_main.rb'
require 'rspec'

RSpec.describe DictionaryModule do
  let(:dict) { DictionaryModule::Dictionary.new Node.new }
  describe "dictionary_class" do
    context "given valid string to insert"
      context "given #{""} to insert" do
        it "returns false" do
          expect(dict.insert_node("")).to eq(false)
        end
      end

      context "given hi to insert" do
        it "returns true" do
          expect(dict.insert_node("hi")).to eq(true) 
        end
      end

      context "given capital valid string to insert" do
        it "returns true" do
          expect(dict.insert_node("HELLO")).to eq(true) 
        end
      end

      context "given valid string with capital letters in middle to insert" do
        it "returns true" do
          expect(dict.insert_node("heLLO")).to eq(true) 
        end
      end
      
      context "given nil to insert" do
        it "returns false" do
          expect(dict.insert_node(nil)).to eq(false) 
        end
      end

      context "given special characters to insert" do
        it "returns false" do
          expect(dict.insert_node("abd234@#%ad")).to eq(false) 
        end
      end

      context "given non-string values to insert" do
        it "returns false" do
          expect(dict.insert_node(123)).to eq(false) 
        end
      end
    end

    context "given valid string to search" do
      context "given the string which is already in trie" do
        it "given hi to search" do
          dict.insert_node("hi")
          expect(dict.get_suggested_string("hi")).to eq(nil)
        end
      end

      context "given the string to search which is not in trie" do
        it "returns nil" do
          dict.insert_node("hind")
          expect(dict.get_suggested_string("apple")).to eq(nil) 
        end
      end

      context "given the wrong string which is not in trie" do
        it "returns an array of suggested words" do
          dict.insert_node("hi")
          dict.insert_node("hind")
          dict.insert_node("hello")
          expect(dict.get_suggested_string("hifi")).to eq(["hi","hind"])
        end
      end

      context "given the special characters to search" do
        it "returns nil" do
          expect(dict.get_suggested_string("#$%@!@")).to eq(nil)
        end
      end

      context "given numbers to search" do
        it "returns nil" do
          expect(dict.get_suggested_string("12334")).to eq(nil)
        end
      end

      context "given non-string value to search" do
        it "returns nil" do
          expect(dict.get_suggested_string(12434)).to eq(nil)
        end
      end

      context "given empty string to search" do
        it "returns nil" do
          expect(dict.get_suggested_string(" ")).to eq(nil)
        end
      end

      context "given nil string to search" do
        it "returns nil" do
          expect(dict.get_suggested_string(nil)).to eq(nil)
        end
      end

      context "given the valid string to search with newline in last" do
        it "returns an array of suggested words" do
          dict.insert_node("hi")
          dict.insert_node("hind")
          dict.insert_node("hello")
          expect(dict.get_suggested_string("hi fi\n")).to eq(["hi","hind"])
        end
      end

      context "given the valid string to search with tab in last" do
        it "returns an array of suggested words" do
          dict.insert_node("banana")
          dict.insert_node("bat")
          dict.insert_node("buffalo")
          expect(dict.get_suggested_string("bye\t")).to eq(["banana","bat","buffalo"])
        end
      end

      context "given the capital string which is not in trie" do
        it "returns an array of suggested words" do
          dict.insert_node("apple")
          dict.insert_node("app")
          dict.insert_node("application")
          expect(dict.get_suggested_string("Appolo")).to eq(["app","apple","application"])
        end
      end
    end
  end

 