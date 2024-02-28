require './min_heap'

RSpec.describe MinHeap do
  let(:heap) { MinHeap.new }

  describe '#push/#pop' do
    it do
      expect(heap.array).to eq([])
      expect(heap.pop).to eq(nil)
    end

    it do
      heap.push(5, 'A')

      expect(heap.array).to eq([[5, "A"]])

      expect(heap.pop).to eq([5, 'A'])
    end

    it do
      heap.push(5, 'A')
      heap.push(1, 'B')
      heap.push(3, 'C')
      heap.push(2, 'D')

      expect(heap.array).to eq([[1, "B"], [2, "D"], [3, "C"], [5, "A"]])

      pop_items = []
      while item = heap.pop
        pop_items.push(item)
      end
      expect(pop_items).to eq([[1, 'B'], [2, 'D'], [3, 'C'], [5, 'A']])
    end

    it do
      heap.push(5, 'A')
      heap.push(1, 'B')
      heap.push(3, 'C')
      heap.push(2, 'D')
      heap.push(5, 'E')
      heap.push(1, 'F')

      expect(heap.array).to eq([[1, "B"], [2, "D"], [1, "F"], [5, "A"], [5, "E"], [3, "C"]])

      pop_items = []
      while item = heap.pop
        pop_items.push(item)
      end
      expect(pop_items).to eq([[1, 'B'], [1, 'F'], [2, 'D'], [3, 'C'], [5, 'A'], [5, 'E']])
    end
  end
end