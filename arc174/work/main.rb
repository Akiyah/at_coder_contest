require "ac-library-rb/segtree"

$debug = !ARGV[0].nil?

N, C = STDIN.gets.chomp.split.map(&:to_i)
#AS = (1..N).map { STDIN.gets.chomp.split.map(&:to_i) }.sort_by { |a, b| -a * b }
AS = STDIN.gets.chomp.split.map(&:to_i)
# pp AS


sum = nil
m = 0
l = nil
m_l = 0
m_r = 0
# 総和が正で最大の区間を探す C <= 0 の場合は負で最小の区間を探す
if 0 < C
  (0...N).each do |i|
    a = AS[i]

    if sum == nil
      if 0 < a # 区間の始まり
        l = i
        sum = a
        m = sum if m < sum
      end
    else
      sum += a
      if m < sum # 区間の終了の更新
        m = sum
        m_l = l
        m_r = i
      end
      if sum <= 0 # 区間を探すのをやめる
        sum = nil
      end
    end

    pp [i, a, sum, l, m, m_l, m_r] if $debug
  end
else
  (0...N).each do |i|
    a = AS[i]

    if sum == nil
      if a < 0 # 区間の始まり
        l = i
        sum = a
        m = sum if sum < m
      end
    else
      sum += a
      if sum < m # 区間の終了の更新
        m = sum
        m_l = l
        m_r = i
      end
      if 0 <= sum # 区間を探すのをやめる
        sum = nil
      end
    end

    pp [i, a, sum, l, m, m_l, m_r] if $debug
  end
end

pp [m, m_l, m_r] if $debug

result0 = AS.sum

# result1 = AS[0...right_i].sum + AS[right_i..left_i].sum * C + AS[(left_i + 1)..-1].sum

if 0 < C
  puts result0 + m * (C - 1)
else
  puts result0 + m * (C - 1)
end
