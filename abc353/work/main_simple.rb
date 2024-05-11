# require "ac-library-rb/priority_queue"

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end

N, K = STDIN.gets.chomp.split.map(&:to_i)
PS = STDIN.gets.chomp.split.map(&:to_i)

ps = PS.map do |p|
  p - 1
end

rs = []
ps.each.with_index do |p, i|
  rs[p] = i
end

pp PS if $debug
pp ps if $debug
pp rs if $debug

is_min = N
(0..(N - K)).each do |i|
  is = rs[i...(i + K)]
  # is = (i...(i + K)).map do |j|
  #   PS.find_index(j)
  # end
  pp i...(i + K) if $debug
  pp is if $debug
  is_min = [is_min, is.max - is.min].min
end



puts is_min
