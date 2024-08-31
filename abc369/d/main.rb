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
AS = STDIN.gets.chomp.split.map(&:to_i)

if N == 1
  puts AS[0]
  exit
end

if N == 2
  puts AS[0] + AS[1] * 2
  exit
end

c_odd_max = 0
c_even_max = 0
AS.each.with_index do |a, i|
  pp [a, i] if $debug

  if i == 0
    c_odd_max = a
    c_even_max = 0
    next
  end

  # 戦う場合
  c_even_1 = c_odd_max + 2 * a # 今回が偶数回の場合
  c_odd_1 = c_even_max + a # 今回が奇数回の場合

  # 逃げる場合
  c_odd_2 = c_odd_max # 今回が偶数回の場合
  c_even_2 = c_even_max # 今回が奇数回の場合

  c_odd_max = [c_odd_1, c_odd_2].max
  c_even_max = [c_even_1, c_even_2].max

  pp [a, i, c_odd_max, c_even_max] if $debug
end

puts [c_odd_max, c_even_max].max
