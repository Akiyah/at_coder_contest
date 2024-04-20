# require "ac-library-rb/segtree"

$debug = !ARGV[0].nil?

N = STDIN.gets.chomp.to_i
AS = STDIN.gets.chomp.split.map(&:to_i)

as = [nil] + AS.dup
rs = []
as[1..-1].each.with_index do |a, i|
  rs[a] = i + 1
end

pp "as: ", as if $debug

actions = []
(1..N).each do |k|
  a = as[k]
  if a != k
    i = k
    j = rs[k]
    actions << [i, j]
    as[i], as[j] = as[j], as[i]
    rs[as[i]], rs[as[j]] = rs[as[j]], rs[as[i]]
  end
  pp "as: ", as if $debug
  pp "rs: ", rs if $debug
end

pp actions if $debug

puts actions.size
actions.each do |i, j|
  puts "#{i} #{j}"
end
