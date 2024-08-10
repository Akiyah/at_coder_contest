# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end

N = STDIN.gets.chomp.to_i
SS = (1..N).map do
  STDIN.gets.chomp.split('')
end

m1 = SS.map { |s| s.length }.max
pp m1 if $debug

m = 0
ts = [[]] * m1
SS.each do |s|
  m = [m, s.length].max
  m2 = m - s.length
  m3 = m1 - m
  (s + ['*'] * m2 + [''] * m3).each.with_index do |c, i|
    ts[i] = [c] + ts[i]
  end  
end

ts.each do |t|
  puts t.join('')
end
