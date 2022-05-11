require 'rails_helper'

RSpec.describe ProductSpec, type: :model do
  describe 'Validations' do

    it 'Will save with all field submitted' do
    @category = Category.new
    @Product = Product.new
    @category.name = 'demo'
    @Product.name = 'demo'
    @Product.price_cents = 530
    @Product.quantity = 5
    @Product.category = @category
    expect(@Product.name).to be_present
    expect(@Product.price).to be_present
    expect(@Product.quantity).to be_present
    expect(@Product.category).to be_present
    end
    
    it 'Will have a name' do 
      @category = Category.new
      @Product = Product.new
      @category.name = 'demo'
      @Product.name = nil
      @Product.price_cents = 530
      @Product.quantity = 5
      @Product.category = @category
      expect(@Product).to_not be_valid
     
      @Product.name = 'demo'
      expect(@Product.name).to be_present
      expect(@Product.errors.full_messages).to eq ["Name can't be blank"]
    end 
    
    it 'Will have a price' do
      @category = Category.new
      @Product = Product.new
      @category.name = 'demo'
      @Product.name = 'demo'
      @Product.price_cents = nil
      @Product.quantity = 5
      @Product.category = @category
      expect(@Product).to_not be_valid
      expect(@Product.errors.full_messages[2]).to eq "Price can't be blank"
     
      @Product.price_cents = 530
      expect(@Product).to be_valid
      
    end

    it 'Will have a quatity' do 
      @category = Category.new
      @Product = Product.new
      @category.name = 'demo'
      @Product.name = 'demo'
      @Product.price_cents = 530
      @Product.quantity = nil
      @Product.category = @category
      expect(@Product).to_not be_valid
      expect(@Product.errors.full_messages).to eq ["Quantity can't be blank"]

      @Product.quantity = 5
      expect(@Product).to be_valid
    end

    it 'Will have a category' do 
      @category = Category.new
      @Product = Product.new
      @category.name = 'demo'
      @Product.name = 'demo'
      @Product.price_cents = 530
      @Product.quantity = 5
      @Product.category = nil
      expect(@Product).to_not be_valid
      expect(@Product.errors.full_messages[1]).to eq "Category can't be blank"

      @Product.category = @category
      expect(@Product).to be_valid
    end
  end
end
