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
BS = STDIN.gets.chomp.split.map(&:to_i)


def calc()
  as = AS.sort.reverse
  bs = BS.sort.reverse

  c = 0
  j = 0
  as.each_with_index do |a, i|
    return a if j == 0 && i == N - 1
    if a <= bs[i - j]
    else
      if j != 0
        return -1
      end
      c = a
      j = 1
    end
  end

  c
end

puts calc
