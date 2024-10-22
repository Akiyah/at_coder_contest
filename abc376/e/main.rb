require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end

T = STDIN.gets.chomp.to_i

NKABS = (1..T).map do
  n, k = STDIN.gets.chomp.split.map(&:to_i)
  as = STDIN.gets.chomp.split.map(&:to_i)
  bs = STDIN.gets.chomp.split.map(&:to_i)
  [n, k, as, bs]
end

NKABS.each do |n, k, as, bs|
  abs = as.zip(bs).sort_by { |a, b| a}

  pp abs if $debug

  as2 = abs.map { |a, b| a}
  bs2 = abs.map { |a, b| b}

  a_max = as2[k - 1]
  b_sum = bs2[0...k].sum
  pq = AcLibraryRb::PriorityQueue.new(bs2[0...k])

  pp ['a_max', a_max, 'b_sum', b_sum] if $debug
  r = a_max * b_sum

  (k...n).each do |i|
    a_max = as2[i]
    pq.push(bs2[i])
    b3 = pq.pop
    b_sum += (bs2[i] - b3)

    pp ['a_max', a_max, 'b_sum', b_sum] if $debug
    r = [r, a_max * b_sum].min
  end

  puts r
end
