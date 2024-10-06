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

N, X = STDIN.gets.chomp.split.map(&:to_i)
APBQS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end



def calc_w_i(w, i)
  a, p, b, q = APBQS[i]

  sa = (0..b).map do |k| # Aの個数
    if w <= k * a
      k * p
    else
      w2 = w - k * a
      j = (w2 % b == 0 ? w2 / b : w2 / b + 1)
      k * p + j * q
    end
  end.min

  sb = (0..a).map do |k| # Bの個数
    if w <= k * b
      k * q
    else
      w2 = w - k * b
      j = (w2 % a == 0 ? w2 / a : w2 / a + 1)
      j * p + k * q
    end
  end.min

  [sa, sb].min
end

def calc_w(w)
  (0...N).sum { |i| calc_w_i(w, i) }
end

def calc
  w0 = 0 # 初期状態：成立
  w1 = 10 ** (7 + 2 + 2) # 初期状態：不成立のはず

  return w1 if calc_w(w1) <= X

  while w1 - w0 > 1
    w = (w0 + w1) / 2
    x = calc_w(w)
    if x <= X
      w0 = w
    else
      w1 = w
    end
    pp [[w0, w1, w], x, X, x <= X] if $debug
  end

  w0
end



puts calc
