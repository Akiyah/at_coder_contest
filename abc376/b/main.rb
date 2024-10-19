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
HTS = (1..Q).map do
  h, t = STDIN.gets.chomp.split
  [h, t.to_i]
end


co = 0
il = 1
ir = 2
HTS.each do |h, t|
  if h == 'R'
    if ir <= t # 大きい数字に移動したい場合
      if ir < il && il < t # 間にLがいる場合
        # 逆周り
        co += N - (t - ir)
        ir = t
      else
        co += t - ir
        ir = t
      end
    else # 小さい数字に移動したいばあい
      if t < il && il < ir # 間にLがいる場合
        # 逆周り
        co += N - (ir - t)
        ir = t
      else
        co += ir - t
        ir = t
      end
    end
  else
    if il <= t # 大きい数字に移動したい場合
      if il < ir && ir < t # 間にLがいる場合
        # 逆周り
        co += N - (t - il)
        il = t
      else
        co += t - il
        il = t
      end
    else # 小さい数字に移動したいばあい
      if t < ir && ir < il # 間にLがいる場合
        # 逆周り
        co += N - (il - t)
        il = t
      else
        co += il - t
        il = t
      end
    end
  end
end

puts co
