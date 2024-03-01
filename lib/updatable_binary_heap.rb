class UpdatableBinaryHeap
  def initialize
    @heap = []
    @index = {}
  end

  def push(x)
    i = @heap.size
    @heap << x
    @index[x] = i
    while i > 0
      parent = (i - 1) / 2
      break if @heap[parent] <= x
      swap(i, parent)
      i = parent
    end
  end

  def pop
    ret = @heap[0]
    x = @heap.pop
    @index.delete(ret)
    return ret if @heap.empty?

    i = 0
    @heap[i] = x
    @index[x] = i
    while (child = 2 * i + 1) < @heap.size
      child += 1 if child != @heap.size - 1 && @heap[child] > @heap[child + 1]
      break if @heap[child] >= x
      swap(i, child)
      i = child
    end
    ret
  end

  def decrease_key(old, new)
    i = @index[old]
    @heap[i] = new
    @index.delete(old)
    @index[new] = i
    while i > 0
      parent = (i - 1) / 2
      break if @heap[parent] <= new
      swap(i, parent)
      i = parent
    end
  end

  def size
    @heap.size
  end

  def empty?
    @heap.empty?
  end

  private

  def swap(i, j)
    @heap[i], @heap[j] = @heap[j], @heap[i]
    @index[@heap[i]] = i
    @index[@heap[j]] = j
  end
end