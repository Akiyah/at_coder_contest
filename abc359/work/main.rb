# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end

# inf = (1 << 60) - 1
# seg_max = AcLibraryRb::Segtree.new(rs, -inf) { |x, y| [x, y].max }

N, K = STDIN.gets.chomp.split.map(&:to_i)
S = STDIN.gets.chomp

R = 998244353

# def good?(ss) # K文字の文字列
#   (0...(K/2)).any? { |i| ss[i] != ss[K - 1 - i] }
# end
def good?(j) # K文字の文字列
  (0...(K/2)).any? { |i| j[i] != j[K - 1 - i] }
end

def paste(ss) # K文字の文字列、?をAかBに展開する
  rs = ['']
  ss.each do |s|
    rs = rs.map do |r|
      if s == '?'
        [r + 'A', r + 'B']
      else
        [r + s]
      end
    end.flatten
  end
  rs
end

def s_to_i(s)
  s.split('').map { |s| s == 'A' ? 0 : 1 }.join.to_i(2)
end


# A = 0
# B = 1
def count
  ss = S.split('')
  # dp = Hash.new(0)
  dp = Array.new(2 ** K, 0)

  # 最初のK文字
  ss0 = ss[0...K]
  ss1 = paste(ss0)
  pp ss1 if $debug
  ss1.each do |s|
    dp[s_to_i(s)] = 1 if good?(s)
  end
  pp dp if $debug

  (K...N).each do |i|
    # dp_new = Hash.new(0)
    dp_new = Array.new(2 ** K, 0)
    if ss[i] == '?'
      dp.each.with_index do |v, j|
        # ka = k[1..-1] + 'A'
        # kb = k[1..-1] + 'B'
        ka = ((j * 2) % (2 ** K)) + 0
        kb = ((j * 2) % (2 ** K)) + 1
        pp [ka, kb, dp_new[ka], dp_new[kb]] if $debug
        dp_new[ka] = (dp_new[ka] + v) % R if good?(ka)
        dp_new[kb] = (dp_new[kb] + v) % R if good?(kb)
      end
    else
 #     dp.each do |k, v|
      dp.each.with_index do |v, j|
          # ks = k[1..-1] + ss[i]
        ks = ((j * 2) % (2 ** K)) + (ss[i] == 'A' ? 0 : 1)
        pp [ks, dp_new[ks]] if $debug
        dp_new[ks] = (dp_new[ks] + v) % R if good?(ks)
      end
    end
    dp = dp_new
    pp dp if $debug
  end

  pp dp if $debug
  dp.sum % R
end

puts count


