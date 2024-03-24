# require "ac-library-rb/segtree"

$debug = !ARGV[0].nil?

N = STDIN.gets.chomp.to_i
PS = STDIN.gets.chomp.split.map(&:to_i)
S = STDIN.gets.chomp

X = 998244353


def calc_d(ss, qs, s)
  s2 = (s == 'R' ? 'L' : 'R')
  d = (s == 'R' ? 1 : -1)
  x2_count = 0

  pp [ss, qs, s, s2, d] if $debug

  (0...N).each do |i|
    pp "#{i}, #{qs[i]}, #{ss[i]}" if $debug
    # return 0 if ss[i] == s2 # 逆向き

    pp [i, (i - d + N) % N, qs[i], qs[(i - d + N) % N], qs[i] > qs[(i - d + N) % N]] if $debug
    if qs[i] > qs[(i - d + N) % N] # 逆方向が取られているばあい
      # result *= (ss[i] == '?' ? 2 : 1) # 逆方向が取られている場合は2通りのどちらでも成立する
      # result %= X
      if ss[i] == '?'
        pp "#{i}, #{qs[i]}, #{ss[i]}} : x2" if $debug
      end
      x2_count += 1 if ss[i] == '?'
    else
      return 0 if ss[i] == s2
    end
  end

  (2 ** x2_count) % X
  #(2 ** x2_count)
  #result
end


def calc(ss, qs)
  result = 0

  # pp calc_d(ss, qs, 'R')
  # pp calc_d(ss, qs, 'L')
  r_r = calc_d(ss, qs, 'R')
  pp "r_r: #{r_r}" if $debug
  r_l = calc_d(ss, qs, 'L')
  pp "r_l: #{r_l}" if $debug
  (r_r + r_l) % X
end


ss = S.split('')

qs = []
PS.each_with_index do |p, i|
  qs[p - 1] = i + 1
end


puts calc(ss, qs)
