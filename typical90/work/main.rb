
# require "ac-library-rb/segtree"

$debug = !ARGV[0].nil?

N = STDIN.gets.chomp.to_i
XYS = (1..N).map do
  STDIN.gets.chomp.split(' ').map(&:to_i)
end
pp XYS if $debug


def calc_one(i)
  pp "calc_one(#{i})" if $debug
  x0, y0 = XYS[i]

  cs = []
  N.times do |j|
    next if j == i

    x1, y1 = XYS[j]
    x, y = x1 - x0, y1 - y0
    cs << Math.atan2(y, x)
  end
  # pp cs.map {|c| c / Math::PI * 180} if $debug

  c_max = cs.map do |c0|
    cs.map do |c1|
      c = (c1 - c0).abs
      (c < Math::PI) ? c : 2 * Math::PI - c
    end.max
  end.max

  c_max / Math::PI * 180
end

def calc
  (0...N).map do |i|
    calc_one(i)
  end.max
end

r = calc
puts r.to_i == r ? r.to_i : r
