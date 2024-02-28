class MinHeap
  attr_reader :array

  def initialize
    @array = []
  end

  def push(value, item)
    @array.push([value, item])

    i = @array.size - 1
    while i > 0
      j = (i - 1) / 2
      break if @array[i][0] >= @array[j][0]
      @array[i], @array[j] = @array[j], @array[i]
      i = j
    end
  end

  def pop
    ret = @array.shift

    return nil if ret.nil?
    return ret if @array.empty?

    @array.unshift(@array.pop)

    j = 0
    while (i = j * 2 + 1) < @array.size
      if !@array[i + 1].nil? && @array[i + 1][0] < @array[i][0]
        i = i + 1 # right child
      end
    
      break if @array[i][0] >= @array[j][0]
      @array[j], @array[i] = @array[i], @array[j]
      j = i
    end
    ret
  end
end
