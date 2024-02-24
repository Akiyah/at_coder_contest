N = gets.chomp.to_i

ABXS = (1...N).map do
  gets.chomp.split.map(&:to_i)
end

MIN_COST = []
MIN_COST[1] = 0

VS_CALCED = []
VS_CALCING = []

VS_CALCING << [1, 0] # index, cost


def calc
  loop do
    # pp "*" * 50
    # pp [VS_CALCED.count, VS_CALCING.count]
    # pp VS_CALCED
    # pp VS_CALCING
    #unless
    # VS_CALCED.include? { |v| v[0] == N }
    #v = VS_CALCING.min { |v| v[1] }
    v = VS_CALCING.min { |a, b| a[1] <=> b[1] }
    # pp v
    i, cost = v

    if i == N
      return cost
    end

    a, b, x = ABXS[i - 1]

    v2 = VS_CALCING.find { |v| v[0] == i + 1 }
    if v2
      if cost + a < v2[1]
        v2[1] = cost + a
      end
    else
      VS_CALCING << [i + 1, cost + a] unless VS_CALCED.index(i + 1)
    end

    v3 = VS_CALCING.find { |v| v[0] == x }
    if v3
      if cost + b < v3[1]
        v3[1] = cost + b
      end
    else
      VS_CALCING << [x, cost + b] unless VS_CALCED.index(x)
    end

    VS_CALCING.delete(v)
    VS_CALCED << v[0]
  end
end




puts calc
