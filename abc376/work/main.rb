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

N, Q = STDIN.gets.chomp.split.map(&:to_i)

NTS = (1..Q).map do
  h, t = STDIN.gets.chomp.split
  [h, t.to_i - 1]
end

# pp [N, Q, NTS] if $debug


def move_plus(t, l, r) # lをプラス方向に動かす
  # pp ['move_l_plus', t, l, r] if $debug
  #return [[l, r], 0] if l == t

  t2 = (t < l ? t + N : t)
  r2 = (r < l ? r + N : r)
  # l <= t2, l < r2

  if r2 <= t2 # rがlとtの間にある場合
    [t, (t + 1) % N, (t2 - l) + (t2 + 1 - r2)]
  else
    [t, r, t2 - l]
  end
end

dp = {}
dp[[0, 1]] = 0
# pp dp if $debug

NTS.each do |h, t|
  dp_next = {}
  if h == 'L'
    dp.each do |(l, r), c|
      # プラス方向
      l2, r2, c2 = move_plus(t, l, r)
      lr2 = [l2, r2]
      dp_next[lr2] = c + c2 if !dp_next[lr2] || c + c2 < dp_next[lr2]

      # マイナス方向
      l2, r2, c2 = move_plus(N - t, N - l, N - r)
      lr2 = [N - l2, N - r2]
      dp_next[lr2] = c + c2 if !dp_next[lr2] || c + c2 < dp_next[lr2]
    end
  else # h == 'R'
    dp.each do |(l, r), c|
      # プラス方向
      r2, l2, c2 = move_plus(t, r, l)
      lr2 = [l2, r2]
      dp_next[lr2] = c + c2 if !dp_next[lr2] || c + c2 < dp_next[lr2]

      # マイナス方向
      r2, l2, c2 = move_plus(N - t, N - r, N - l)
      lr2 = [N - l2, N - r2]
      dp_next[lr2] = c + c2 if !dp_next[lr2] || c + c2 < dp_next[lr2]
    end
  end

  dp = dp_next
  puts dp.size if $debug
end

pp dp if $debug

puts dp.values.min
