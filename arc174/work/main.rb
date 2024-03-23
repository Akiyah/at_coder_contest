# require "ac-library-rb/segtree"

$debug = !ARGV[0].nil?

N = STDIN.gets.chomp.to_i



def calc(as, ps)
  pp [as, ps] if $debug
  # 3 <= (as[1 - 1] * 1 + as[2 - 1] * 2 + as[3 - 1] * 3 + (as[4 - 1] + a4) * 4 + (as[5 - 1] + a5) * 5) / (as[1 - 1] + as[2 - 1] + as[3 - 1] + (as[4 - 1] + a4) + (as[5 - 1] + a5))
  # となるa4, a5でループを回す。
  # 3 * (as[1 - 1] + as[2 - 1] + as[3 - 1] + (as[4 - 1] + a4) + (as[5 - 1] + a5)) <= (as[1 - 1] * 1 + as[2 - 1] * 2 + as[3 - 1] * 3 + (as[4 - 1] + a4) * 4 + (as[5 - 1] + a5) * 5)
  # as[1 - 1] * 2 + as[2 - 1] <= (as[4 - 1] + a4) + (as[5 - 1] + a5) * 2
  # (as[1 - 1] * 2 + as[2 - 1] - as[4 - 1] - a4) / 2 <= as[5 - 1] + a5
  # (as[1 - 1] * 2 + as[2 - 1] - as[4 - 1] - a4) / 2 - as[5 - 1] <= a5
  # a4 = 0 のとき、
  # (as[1 - 1] * 2 + as[2 - 1] - as[4 - 1]) / 2 - as[5 - 1] <= a5

  a5_max = Rational(as[1 - 1] * 2 + as[2 - 1] - as[4 - 1], 2).ceil - as[5 - 1]

  a5s = [0]
  a5s << a5_max if 0 < a5_max
  a5s << a5_max - 1 if 1 < a5_max

  # (0..a5_max).map do |a5|
  a5s.map do |a5|
    a4 = as[1 - 1] * 2 + as[2 - 1] - (as[5 - 1] + a5) * 2 - as[4 - 1]
    a4 = 0 if a4 < 0

    x = ps[4 - 1] * a4 + ps[5 - 1] * a5
    pp "a4: #{a4}, a5: #{a5}, x: #{x}" if $debug
    x
  end.min
end



(1..N).each do
  as = STDIN.gets.chomp.split.map(&:to_i)
  ps = STDIN.gets.chomp.split.map(&:to_i)

  puts calc(as, ps)
end
