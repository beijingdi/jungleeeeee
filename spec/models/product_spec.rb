require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "is valid with valid attributes" do
      goodCategory = Category.new(:name => "rare")
      goodProduct = Product.new(:name => "Di", :price => 999999, :quantity => 1, :category => goodCategory)
      assert goodProduct.save!
    end
    it "is not valid without a name" do
      goodCategory = Category.new(:name => "rare")
      noNameProduct = Product.new(:name => nil, :price => 999999, :quantity => 1, :category => goodCategory)
      assert_not noNameProduct.save!
    end
    it "is not valid without a price" do
      goodCategory = Category.new(:name => "rare")
      noPriceProduct = Product.new(:name => "Di", :price => nil, :quantity => 1, :category => goodCategory)
      assert_not noPriceProduct.save!
    end
    it "is not valid without a quantity" do
      goodCategory = Category.new(:name => "rare")
      noQuantityProduct = Product.new(:name => "Di", :price => 999999, :quantity => nil, :category => goodCategory)
      assert_not noQuantityProduct.save!
    end
    it "is not valid without a category" do
      noCategoryProduct = Product.new(:name => "Di", :price => 999999, :quantity => 1, :category => nil)
      assert_not noCategoryProduct.save!
    end
  end
end
