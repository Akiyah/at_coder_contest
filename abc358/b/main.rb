# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end

# inf = (1 << 60) - 1
# seg_max = AcLibraryRb::Segtree.new(rs, -inf) { |x, y| [x, y].max }


N, A = STDIN.gets.chomp.split.map(&:to_i)
TS = STDIN.gets.chomp.split.map(&:to_i)


last_sec = 0
rs = TS.map do |t|
  r = if last_sec < t
    t + A
  else
    last_sec + A
  end
  
  last_sec = r

  r
end


puts rs.join("\n")
