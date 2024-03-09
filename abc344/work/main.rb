# require "ac-library-rb/segtree"


T = gets.chomp
N = gets.chomp.to_i
SS = (1..N).map do
  gets.chomp.split[1..-1].sort_by(&:size).reverse
end

pp SS

max_ss_sizes = SS.map do |ss|
  ss.map(&:size).max
end

pp max_ss_sizes

REMAIN_MAX_SS_SIZES = (0...N).map do |i|
  max_ss_sizes[i..-1].sum
end

pp REMAIN_MAX_SS_SIZES

# pp SS

$min_cost = N + 1

def calc(t, d, cost)
  return if d == N
  return if $min_cost <= cost + 1
  return if REMAIN_MAX_SS_SIZES[d] < t.size
  pp [d, cost, $min_cost, t]

  SS[d].each do |s|
    if t == s
      $min_cost = cost + 1
    else
      if t.start_with?(s)
        calc(t[s.size..-1], d + 1, cost + 1)
      # else
      #   calc(t, d + 1, cost)
      end
    end
  end
  calc(t, d + 1, cost)
end


calc(T, 0, 0)

if $min_cost == N + 1
  puts -1
else
  puts $min_cost
end
#pp results.min
