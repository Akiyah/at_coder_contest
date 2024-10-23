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

# pp [N, Q, NTS] if $debug


def move_l_plus(t, (l, r)) # lをプラス方向に動かす
  # pp ['move_l_plus', t, l, r] if $debug
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

dp = {}
dp[[0, 1]] = 0
# pp dp if $debug

NTS.each do |h, t|
  dp_next = {}
  dp.each do |(l, r), c|
    l, r = r, l if h == 'R'

    # プラス方向
    (l2, r2), c2 = move_l_plus(t, [l, r])
    l2, r2 = r2, l2 if h == 'R'
    dp_next[[l2, r2]] = [dp_next[[l2, r2]] || c + c2, c + c2].min

    # マイナス方向    
    (l2, r2), c2 = move_l_plus(N - t, [N - l, N - r])
    l2, r2 = r2, l2 if h == 'R'
    l2, r2 = N - l2, N - r2
    dp_next[[l2, r2]] = [dp_next[[l2, r2]] || c + c2, c + c2].min
  end

  dp = dp_next
  puts dp.size if $debug
end

pp dp if $debug

puts dp.values.min
