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
    pp [VS_CALCED.count, VS_CALCING.count]
    #unless
    # VS_CALCED.include? { |v| v[0] == N }
    v = VS_CALCING.min { |v| v[1] }
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
      VS_CALCING << [i + 1, cost + a]
    end

    v3 = VS_CALCING.find { |v| v[0] == x }
    if v3
      if cost + b < v3[1]
        v3[1] = cost + b
      end
    else
      VS_CALCING << [x, cost + b]
    end

    VS_CALCING.delete(v)
    VS_CALCED << v
  end
end




puts calc
