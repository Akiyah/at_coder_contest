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

M, N = STDIN.gets.chomp.split.map(&:to_i)
XS = STDIN.gets.chomp.split.map(&:to_i)

R = 998244353




# pp (1..M).to_a.repeated_permutation(N).to_a if $debug

def check(as)
  as.each.with_index do |a, l|
    r0 = as[(l + 1)..-1].find_index(a)
    unless r0.nil?
      r = r0 + l + 1
      x = XS[a - 1]
      return false unless as[l..r].include?(x)
    end
  end
  true
end

c = 0
(1..M).to_a.repeated_permutation(N).each do |as|
  r = check(as)
  pp [as, r, c] if $debug
  c += 1 if r
end

puts c % R
