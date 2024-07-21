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

N, K = STDIN.gets.chomp.split.map(&:to_i)
S = STDIN.gets.chomp

h = S.chars.tally

def calc_not_kaibun(a, h, n)
  pp [a, h] if $debug
  if K <= a.length
    b = a[(-K)..(-1)]
    pp ['a:', a, 'b:', b] if $debug
    return 0 if b == b.reverse
  end
  if n == 0
    pp ['ok', 'a:', a] if $debug
    return 1
  end

  if n == h.keys.length # values all 1
    pp ['h: ', h, 'a: ', a] if $debug
    b = (K - 1 <= a.length) ? a[(-K + 1)..(-1)].chars : a.chars
    pp ['b: ', b] if $debug
    if (h.keys & b).length == 0 # バラバラの場合
      return (1..n).inject(:*)
    end
  end

  r = 0
  h.each do |k, v|
    if 0 < v
      h2 = h.dup
      h2[k] -= 1
      h2.delete(k) if h2[k] == 0
      r += calc_not_kaibun(a + k, h2, n - 1)
    end
  end
  r
end

r = calc_not_kaibun('', h, N)


puts r
