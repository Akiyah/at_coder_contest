class MaxHeap
  attr_reader :array

  def initialize
    @array = []
  end

  def push(value, item)
    @array.push([value, item])

    i = @array.size - 1
    while i > 0
      j = (i - 1) / 2
      break if @array[i][0] <= @array[j][0]
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
      if !@array[i + 1].nil? && @array[i + 1][0] > @array[i][0]
        i = i + 1 # right child
      end

      break if @array[i][0] <= @array[j][0]
      @array[j], @array[i] = @array[i], @array[j]
      j = i
    end
    ret
  end
end

N, M = gets.chomp.split.map(&:to_i)

#diagrams = Hash.new() { {} }
diagrams = Hash.new do |hash, key|
  hash[key] = Hash.new { |hash, key| hash[key] = [] }
end
(1..M).map do
  l, d, k, c, a, b = gets.chomp.split.map(&:to_i)
  # diagrams[b] ||= {}
  # diagrams[b][a] ||= []
  diagrams[b][a] << [l, d, k, c]
end

calced = {}
calcing = MaxHeap.new
f = Array.new(N - 1, 'Unreachable')

# calcing[N] = Float::INFINITY
calcing.push(Float::INFINITY, N)

def calc(diagrams, calced, calcing, f)
  while 0 < calcing.array.length do
    # b = calcing.keys.max { |a, b| calcing[a] <=> calcing[b] }
    # tb = calcing[b]
    tb, b = calcing.pop
    next if calced[b]

    if diagrams[b]
      diagrams[b].each do |a, ldkcs|
        next if calced[a]
        ldkcs.each do |l, d, k, c|
          if tb == Float::INFINITY
            x = k - 1
            # calcing[a] = l + x * d
            calcing.push(l + x * d, a)
          else
            if l <= tb - c
              x = [(tb - c - l) / d, k - 1].min
              # calcing[a] = l + x * d
              calcing.push(l + x * d, a)
            end
          end
        end
      end
    end

    calced[b] = true
    f[b - 1] = tb
    # pp f
    # calcing.delete(b)
  end
end



calc(diagrams, calced, calcing, f)

# pp f
# (1...N).each do |i|
#   puts f[i] #  ? f[i] : 'Unreachable'
# end

puts f[0...(-1)].join("\n")