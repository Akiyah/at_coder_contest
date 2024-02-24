N = gets.chomp.to_i

ABXS = (1...N).map do
  gets.chomp.split.map(&:to_i)
end

VS_CALCED = []
VS_CALCING = []

VS_CALCING[1] = 0 # index, cost


def calc
  loop do
    # v = VS_CALCING.min { |a, b| a[1] <=> b[1] }
    min_value = VS_CALCING.compact.min
    i = VS_CALCING.find_index(min_value)
    cost = VS_CALCING[i]

    if i == N
      return cost
    end

    a, b, x = ABXS[i - 1]

    unless VS_CALCED[i + 1]
      if VS_CALCING[i + 1]
        VS_CALCING[i + 1] = [VS_CALCING[i + 1], cost + a].min
      else
        VS_CALCING[i + 1] = cost + a
      end
    end

    unless VS_CALCED[x]
      if VS_CALCING[x]
        VS_CALCING[x] = [VS_CALCING[x], cost + b].min
      else
        VS_CALCING[x] = cost + b
      end
    end

    VS_CALCING[i] = nil
    VS_CALCED[i] = true
  end
end




puts calc
