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

N, T = STDIN.gets.chomp.split.map(&:to_i)
S = STDIN.gets.chomp
XS = STDIN.gets.chomp.split.map(&:to_i)

xss = XS.zip(S.split('')).map { |x, s| [x, s == '0' ? -1 : 1] }
xs_l = xss.select { |x, s| s == -1 }.map { |x, s| x }
xs_r = xss.select { |x, s| s == 1 }.map { |x, s| x }

xs_l.sort!
xs_r.sort!

pp ['xs_l', xs_l] if $debug
pp ['xs_r', xs_r] if $debug

c = 0
i0 = 0
j0 = 0
xs_l2 = xs_l.dup
xs_r.each do |x_r|
  i = xs_l.index { |x_l| x_r < x_l }
  break if i.nil?
  j = xs_l2.index { |x_l| x_r + T * 2 < x_l }
  if j.nil?
    pp ['if j.nil?', xs_l2.size] if $debug
    j = xs_l2.size
  end
  pp [x_r, xs_l, i, j] if $debug
  c += (j + j0) - (i + i0)
  i0 += i
  j0 += j
  xs_l = xs_l[i..-1]
  xs_l2 = xs_l2[j..-1]
end
puts c
