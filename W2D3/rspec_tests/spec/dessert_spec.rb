require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:dessert) { Dessert.new("pie",10,chef)}

  describe "#initialize" do
    it "sets a type" do
    expect(dessert.type).to eq("pie")
  end

    it "sets a quantity" do
    expect(dessert.quantity).to eq(10)
  end

    it "starts ingredients as an empty array" do
    expect(dessert.ingredients).to eq([])
  end

    it "raises an argument error when given a non-integer quantity" do
      expect{ Dessert.new("x","10",chef)}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("apples")
      expect(dessert.ingredients).to include("apples")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      my_ingredients = ["apples","eggs","flour","sugar"]

      my_ingredients.each{|el| dessert.add_ingredient(el)}
      expect(dessert.ingredients).to eq(my_ingredients)
      dessert.ingredients.shuffle!
      expect(dessert.ingredients).not_to eq(my_ingredients)
      expect(dessert.ingredients.sort).to eq(my_ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
    expect(dessert.eat(5)).to eq(5)
  end

    it "raises an error if the amount is greater than the quantity" do
      expect{dessert.eat(11)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Master Chef Kimmy")
      expect(dessert.serve).to eq("Master Chef Kimmy has made 10 pies!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
