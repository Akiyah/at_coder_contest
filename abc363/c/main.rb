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

ss = S.split('').sort

h = S.split('').group_by {|s| s}.transform_values {|k|k.count}

pattern_count = (1..N).inject(:*)

h.each do |k, v|
  pattern_count /= (1..v).inject(:*)
end

pp ["pattern_count", pattern_count] if $debug


def kaibun?(s)
  s == s.reverse
end


def calc_pattern_count()
  
end


def check(s)
  (0..(N - K)).each do |i|
    if kaibun?(s[i..(i + K - 1)].join(''))
      return false
    end
  end
  true
end


r = 0
ss.permutation(N).to_a.uniq.each do |s|
  r += 1 if check(s)
end



def calc_not_kaibun(a, ss)
  pp [a, ss] if $debug
  if K <= a.length
    b = a[(-K)..(-1)]
    pp ['a:', a, 'b:', b] if $debug
    return 0 if b == b.reverse
  end
  if ss.length == 0
    return 1
  end
  r = 0
  (0...(ss.length)).each do |i|
    r += calc_not_kaibun(a + ss[i], ss[0...i] + ss[(i+1)..-1])
  end
  r
end

r = calc_not_kaibun('', ss)


puts r
