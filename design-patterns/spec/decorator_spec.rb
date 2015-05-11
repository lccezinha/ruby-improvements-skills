require 'spec_helper'
require_relative '../lib/decorator'

describe 'Decorator Pattern' do
  let(:common_item) { Item.new }

  context 'magic item' do
    let(:magic_item) { Item.new true }

    it 'has price 3 times more expansive' do
      expect(magic_item.price).to eq(common_item.price * 3)
    end

    it 'has description' do
      expect(magic_item.description).to eq("#{common_item.description}Magic.")
    end
  end

  context 'Masterpiece item' do
    let(:masterpiece_item) { Item.new false, true  }

    it 'has price 2 times more expansive' do
      expect(masterpiece_item.price).to eq(common_item.price * 2)
    end

    it 'has description' do
      expect(masterpiece_item.description).to eq("#{common_item.description}Masterpiece.")
    end
  end

  context 'magic masterpiece item' do
    let(:full_item) { Item.new true, true  }

    it 'has price 6 times more expansive' do
      expect(full_item.price).to eq(common_item.price * 6)
    end

    it 'has description' do
      expect(full_item.description).to eq("#{common_item.description}Magic.Masterpiece.")
    end
  end

  context 'common_item' do
    it 'has prince' do
      expect(common_item.price).to eq(10)
    end

    it 'has description' do
      expect(common_item.description).to eq('Item.')
    end

    it 'can be used' do
      expect(common_item).to respond_to(:use)
    end
  end
end
