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

T = STDIN.gets.chomp.to_i
ASS = (1..T).map do
  n = STDIN.gets.chomp.to_i
  STDIN.gets.chomp.split.map(&:to_i)
end

def calc(as)
  pp as if $debug
  n = as.length
  x = 0 # 借りている分
  last_a = as[0]
  s = as[0]
  i = 1

  pp ['n', n, 'last_a', last_a, 'a', nil, 'x', x] if $debug

  as[1..-1].each do |a|
    s += a
    i += 1

    pp ['n', n, 'last_a', last_a, 'a', a, 'x', x] if $debug

    if a < last_a
      d = last_a - a
      x += d # 未来から借りる
      a += d # 借りた分でaを増やす
    else # last_a <= a、返却できる場合
      d = a - last_a
      if d < x
        x -= d # 0 <= x
        a -= d
      else # 仮をすべて返せる場合
        a = (s + i - 1) / i
        x = 0
      end
    end

    pp ['n', n, 'last_a', last_a, 'a', a, 'x', x] if $debug

    last_a = a
  end

  0 == x # 借りがない
end


ASS.each do |as|
  puts calc(as) ? 'Yes' : 'No'
end
