
# require "ac-library-rb/segtree"

$debug = !ARGV[0].nil?

N = STDIN.gets.chomp.to_i
XYS = (1..N).map do
  STDIN.gets.chomp.split(' ').map(&:to_i)
end
pp XYS if $debug

def diff_c(c2, c1)
  d = c2 - c1
  #d = 2 * Math::PI - d if Math::PI < d
  d = 2 * 180 - d if 180 < d
  pp ['d', d] if $debug
  d
end

def calc_one(i)
  pp "calc_one(#{i})" if $debug
  x0, y0 = XYS[i]

  cs = []
  N.times do |j|
    next if j == i

    x1, y1 = XYS[j]
    x, y = x1 - x0, y1 - y0
    cs << Math.atan2(y, x) # -PI 〜 PI
  end
  # pp cs.map {|c| c / Math::PI * 180} if $debug

  # c_max = cs.map do |c0|
  #   cs.map do |c1|
  #     c = (c1 - c0).abs
  #     (c < Math::PI) ? c : 2 * Math::PI - c
  #   end.max
  # end.max

  # c_max / Math::PI * 180

  cs = cs.map { |c| c / Math::PI * 180 }
  pp ['cs', cs] if $debug
  cs.sort!
  #cs2 = cs + cs.map { |c| c + 2 * Math::PI }
  cs2 = cs + cs.map { |c| c + 360 }

  pp ['cs', cs] if $debug
  # pp ['cs2', cs2] if $debug

  i = 0
  i2 = 0
  c_max = 0
  while i < N - 1
    pp [i, i2, cs[i], cs2[i2], c_max] if $debug
    if (N - 1) * 2 <= i2
      c_max = [c_max, diff_c(cs2[i2 - 1], cs[i])].max
      pp 'break' if $debug
      break # これ以降は cs[i] は大きくなるので、ここで終了する
    end

    d = cs2[i2] - cs[i]
    if d < 180 # Math::PI
      i2 += 1
      pp 'next' if $debug
      next
    end

    d1 = diff_c(cs2[i2], cs[i])
    d2 = diff_c(cs2[i2 - 1], cs[i])
    c_max = [c_max, d1, d2].max
    pp 'i += 1' if $debug
    i += 1
  end

  # c_max / Math::PI * 180
  pp ['c_max', c_max] if $debug
  c_max
end

def calc
  (0...N).map do |i|
    calc_one(i)
  end.max
end

r = calc
puts r.to_i == r ? r.to_i : r
