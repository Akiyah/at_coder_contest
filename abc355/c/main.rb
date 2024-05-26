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

# inf = (1 << 60) - 1
# seg_max = AcLibraryRb::Segtree.new(rs, -inf) { |x, y| [x, y].max }


N, T = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)

def check
  rows = Array.new(N, 0)
  columns = Array.new(N, 0)
  diagonal1 = 0
  diagonal2 = 0

  AS.each.with_index do |a, i|
    x = (a - 1) % N
    y = (a - 1) / N

    columns[x] += 1
    rows[y] += 1

    diagonal1 += 1 if x == y
    diagonal2 += 1 if x == N - y - 1

    return i + 1 if columns[x] == N
    return i + 1 if rows[y] == N
    return i + 1 if diagonal1 == N
    return i + 1 if diagonal2 == N
  end

  -1
end

puts check
