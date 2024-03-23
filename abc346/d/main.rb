# require "ac-library-rb/segtree"

$debug = !ARGV[0].nil?

N = STDIN.gets.chomp.to_i
S = STDIN.gets.chomp
CS = STDIN.gets.chomp.split.map(&:to_i)

def calc_cost_first(ss, i)
  cost0 = 0
  cost1 = 0
  (0..i).each do |j|
    if (i - j) % 2 == 0
      cost0 += CS[j] if ss[j] != 0
      cost1 += CS[j] if ss[j] != 1
    else
      cost0 += CS[j] if ss[j] != 1
      cost1 += CS[j] if ss[j] != 0
    end
  end

  ((i + 1)..(N - 1)).each do |j|
    if (j - (i + 1)) % 2 == 0
      cost0 += CS[j] if ss[j] != 0
      cost1 += CS[j] if ss[j] != 1
    else
      cost0 += CS[j] if ss[j] != 1
      cost1 += CS[j] if ss[j] != 0
    end
  end

  [cost0, cost1]
end


def calc(ss)
  if ss.size == 2
    return 0 if ss[0] == ss[1]
    return CS.min
  end


  # i = 0 の時
  costs = []
  costs[0] = calc_cost_first(ss, 0)
  costs[1] = calc_cost_first(ss, 1)

  (2...(N - 1)).each do |i|
    costs[i] = []
    costs[i][0] = costs[i - 2][0] + (ss[i] == 0 ? -CS[i] : CS[i]) + (ss[i - 1] == 1 ? -CS[i - 1] : CS[i - 1])
    costs[i][1] = costs[i - 2][1] + (ss[i] == 1 ? -CS[i] : CS[i]) + (ss[i - 1] == 0 ? -CS[i - 1] : CS[i - 1])
  end

  pp costs if $debug
  costs.flatten.min
end


puts calc(S.split('').map(&:to_i))
