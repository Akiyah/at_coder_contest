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
ABS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


edges = {}
ABS.each.with_index do |ab, i|
  ABS.each.with_index do |ab2, j|
    if i != j && (ab[0] == ab2[0] || ab[1] == ab2[1])
      edges[i] ||= []
      edges[j] ||= []
      edges[i] << j
      edges[j] << i
    end
  end
end



def calc(abs)



end



puts calc(ABS) ? 'Takahashi' : 'Aoki'
