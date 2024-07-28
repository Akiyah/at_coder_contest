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

N, Q = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)
BKS = (1..Q).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


as = AS.sort

((as[0] - 10)..(as[-1] + 10)).each do |b|
  i = as.find_index { |a| b < a }
  if i.nil?
    as_left = as.reverse
    as_right = []
  else
    as_left = as[0...i].reverse
    as_right = as[i..]
  end

  pp [as_left, as_right] if $debug

  il = 0
  ir = 0
  cs = []
  (1..N).each do |j|
    pp ['j:', j, 'cs:', cs] if $debug
    if as_left.length <= il
      cs << (as_right[ir] - b)
      ir += 1
      next
    end
    if as_right.length <= ir
      cs << (b - as_left[il])
      il += 1
      next
    end
    if (b - as_left[il]) < (as_right[ir] - b)
      cs << (b - as_left[il])
      il += 1
    else
      cs << (as_right[ir] - b)
      ir += 1
    end
  end
  puts cs.join(', ')
end
