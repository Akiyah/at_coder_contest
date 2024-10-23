require "ac-library-rb/priority_queue"
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

NTS = (1..Q).map do
  h, t = STDIN.gets.chomp.split
  [h, t.to_i - 1]
end

pp [N, Q, NTS] if $debug


def move_l_plus(t, (l, r)) # lをプラス方向に動かす
  pp ['move_l_plus', t, l, r] if $debug
  return [[l, r], 0] if l == t

  t += N if t < l
  r += N if r < l

  if r <= t # rがlとtの間にある場合
    l2 = t % N
    r2 = (t + 1) % N
    c2 = (t - l) + (t + 1 - r)
  else
    l2 = t % N
    r2 = r % N
    c2 = t - l
  end

  [[l2, r2], c2]
end

def move_l_minus(t, (l, r)) # lをマイナス方向に動かす
  pp ['move_l_minus', t, l, r] if $debug
  return [[l, r], 0] if l == t

  t -= N if l < t
  r -= N if l < r

  if t <= r # rがlとtの間にある場合
    l2 = t % N
    r2 = (t - 1) % N
    c2 = (l - t) + (r - (t - 1))
  else
    l2 = t % N
    r2 = r % N
    c2 = l - t
  end

  [[l2, r2], c2]
end

dp = {}
dp[[0, 1]] = 0
pp dp if $debug

NTS.each do |h, t|
  dp_next = {}
  dp.each do |lr, c|
    lr.reverse! if h == 'R'

    # プラス方向
    lr2, c2 = move_l_plus(t, lr)
    lr2.reverse! if h == 'R'
    dp_next[lr2] = [dp_next[lr2] || c + c2, c + c2].min

    # マイナス方向    
    lr2, c2 = move_l_minus(t, lr)
    lr2.reverse! if h == 'R'
    dp_next[lr2] = [dp_next[lr2] || c + c2, c + c2].min
  end

  dp = dp_next
  pp dp if $debug
end

puts dp.values.min
