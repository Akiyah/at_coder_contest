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

# inf = (1 << 60) - 1
# seg_max = AcLibraryRb::Segtree.new(rs, -inf) { |x, y| [x, y].max }


N = STDIN.gets.chomp.to_i
LRS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


def count

  lrs = []
  LRS.each do |l, r|
    lrs << [l, 1]
    lrs << [r, -1]
  end

  pq = AcLibraryRb::PriorityQueue.new(lrs) {|x, y| x[0] == y[0] ? x[1] > y[1] : x[0] < y[0] }

  pp pq if $debug

  # lrs.sort_by! do |lr, up|
  #   [lr, -up]
  # end

  # pp lrs if $debug

  c = 0


  lines = 0
  while x = pq.pop
    lr, up = x
    pp [lr, up, c] if $debug
    if 0 < up
      lines += 1
      c += (lines - 1)
    else
      lines -= 1
    end
    pp [lr, up, c, lines] if $debug
  end

  c
end

puts count
