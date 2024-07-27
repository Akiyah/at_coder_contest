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

N, X, Y = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)
BS = STDIN.gets.chomp.split.map(&:to_i)


def calc

  a_index = nil
  a_sum = 0
  AS.sort.reverse.each.with_index do |a, i|
    a_sum += a
    # pp [a, i, a_sum] if $debug
    if X < a_sum
      a_index = i + 1
      break
    end
  end

  b_index = nil
  b_sum = 0
  BS.sort.reverse.each.with_index do |b, i|
    b_sum += b
    if Y < b_sum
      b_index = i + 1
      break
    end
  end


  # pp [AS.sort.reverse, BS.sort.reverse] if $debug

  pp [a_index, b_index] if $debug
  [a_index || N, b_index || N].min
end

r = calc
puts r
