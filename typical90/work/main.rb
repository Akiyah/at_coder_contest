require "ac-library-rb/segtree"
include AcLibraryRb

$debug = !ARGV[0].nil?

N = STDIN.gets.chomp.to_i
CPS = (1..N).map do
  STDIN.gets.chomp.split(' ').map(&:to_i)
end
Q = STDIN.gets.chomp.to_i
LRS = (1..Q).map do
  STDIN.gets.chomp.split(' ').map(&:to_i)
end


cps1 = CPS.map { |c, p| c == 1 ? p : 0 }
cps2 = CPS.map { |c, p| c == 2 ? p : 0 }

seg_tree1 = Segtree.new(cps1, 0) { |x, y| x + y } 
seg_tree2 = Segtree.new(cps2, 0) { |x, y| x + y } 

LRS.each do |l, r|
  s1 = seg_tree1.prod(l - 1, r)
  s2 = seg_tree2.prod(l - 1, r)
  puts [s1, s2].join(' ')
end
