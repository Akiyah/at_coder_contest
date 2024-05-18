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


N = STDIN.gets.chomp.to_i
ACS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

acis = ACS.map.with_index { |ac, i| [ac[0], ac[1], i] }

pp acis if $debug

acis.sort_by! { |a, c, i| -a }

pp acis if $debug

min_c = acis[0][1]
is = []
acis.each do |a, c, i|
  if min_c < c
  else
    is << i + 1
  end

  min_c = [c, min_c].min
end

pp is if $debug

puts is.count
puts is.sort.join(' ')
