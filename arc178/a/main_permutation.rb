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


N, M = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)



def check
  (1..N).to_a.permutation.to_a.sort.each do |ps|
    pp ps if $debug
    r = AS.all? do |a|
      pp a if $debug
      (0...(N - a)).all? do |b|
        pp b if $debug
        ps[b...(b + a)].sort != (1..a).to_a
      end
    end
    pp r if $debug
    return ps if r
  end

  return [-1]
end

puts check.join(' ')
