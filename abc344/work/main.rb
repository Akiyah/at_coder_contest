# require "ac-library-rb/segtree"


T = gets.chomp
N = gets.chomp.to_i
SS = (1..N).map do
  gets.chomp.split[1..-1].sort_by(&:size).reverse
end
# pp SS

def calc_by_d(dp, d)
  dp_new = Array.new(T.length + 1)
  dp.each_with_index do |cost, ti|
    next unless cost
    # 1 円を支払い、袋 i からちょうどひとつの文字列を選択して S の末尾に連結する。
    SS[d].each do |s|
      if T[ti..-1].start_with?(s)
        ti_new = ti + s.length
        dp_new[ti_new] = [(dp_new[ti_new] || 1000), cost + 1].min
      end
    end

    # 何もしない。
    dp_new[ti] = [(dp_new[ti] || 1000), cost].min
  end

  dp_new
end

def calc()
  dp = Array.new(T.length + 1)
  dp[0] = 0
  (0...N).each do |d|
    dp = calc_by_d(dp, d)
  end
  dp[T.length]
end

result = calc()
puts (result || -1)
