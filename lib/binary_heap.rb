class BinaryHeap
  def initialize
    @heap = []
  end

  def push(x)
    i = @heap.size
    @heap << x
    while i > 0
      parent = (i - 1) / 2
      break if @heap[parent] <= x
      @heap[i] = @heap[parent]
      i = parent
    end
    @heap[i] = x
  end

  def pop
    ret = @heap[0]
    x = @heap.pop
    return ret if @heap.empty?

    i = 0
    while (child = 2 * i + 1) < @heap.size
      child += 1 if child != @heap.size - 1 && @heap[child] > @heap[child + 1]
      break if @heap[child] >= x
      @heap[i] = @heap[child]
      i = child
    end
    @heap[i] = x
    ret
  end

  def size
    @heap.size
  end

  def empty?
    @heap.empty?
  end
end