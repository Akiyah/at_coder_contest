require 'rspec'
require_relative 'binary_heap'

describe BinaryHeap do
  let(:heap) { BinaryHeap.new }

  describe '#push' do
    it 'adds elements to the heap' do
      heap.push(3)
      heap.push(2)
      heap.push(1)
      expect(heap.size).to eq(3)
    end
  end

  describe '#pop' do
    it 'removes and returns the smallest element' do
      heap.push(3)
      heap.push(2)
      heap.push(1)
      expect(heap.pop).to eq(1)
      expect(heap.pop).to eq(2)
      expect(heap.pop).to eq(3)
    end
  end

  describe '#size' do
    it 'returns the number of elements in the heap' do
      expect(heap.size).to eq(0)
      heap.push(3)
      expect(heap.size).to eq(1)
    end
  end

  describe '#empty?' do
    it 'returns true if the heap is empty' do
      expect(heap.empty?).to be true
      heap.push(3)
      expect(heap.empty?).to be false
    end
  end
end