
# require "ac-library-rb/segtree"

$debug = !ARGV[0].nil?

N = STDIN.gets.chomp.to_i
XYS = (1..N).map do
  STDIN.gets.chomp.split(' ').map(&:to_i)
end
pp XYS if $debug

r = (0...N).to_a.permutation(3).map do |p1, p2, p3|
  pp [p1, p2, p3, XYS[p1], XYS[p2], XYS[p3]] if $debug
  ax = XYS[p1][0] - XYS[p2][0]
  ay = XYS[p1][1] - XYS[p2][1]
  bx = XYS[p3][0] - XYS[p2][0]
  by = XYS[p3][1] - XYS[p2][1]
  cos = (ax * bx + ay * by).to_f / Math.sqrt((ax ** 2 + ay ** 2) * (bx ** 2 + by ** 2))
  pp [[ax, ay], [bx, by], cos, Math.acos(cos)] if $debug
  Math.acos(cos) / Math::PI * 180
end.max

puts r.to_i == r ? r.to_i : r
