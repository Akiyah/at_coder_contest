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


def calc
  as = AS.sort
  bkqs = BKS.zip(0...Q).sort_by { |bk, q| bk[1] }

  rs = []
  bkqs.map do |bk, q|
    b, k = bk
    rs[q] = as.map { |a| (b - a).abs }.sort[k - 1]  
  end
  rs
end

rs = calc
rs.each do |r|
  puts r
end
