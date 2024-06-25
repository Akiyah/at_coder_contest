
# require "ac-library-rb/segtree"

$debug = !ARGV[0].nil?

N = STDIN.gets.chomp.to_i
S = STDIN.gets.chomp

R = 10 ** 9 + 7

$cache_calc = {}
def calc(ss, as)
  return $cache_calc[[ss,as]] if $cache_calc[[ss,as]]

  if as.length == 0
    $cache_calc[[ss,as]] = 1
    return $cache_calc[[ss,as]]
  end

  a = as[0]
  $cache_calc[[ss,as]] = ss.map.with_index do |s, i|
    next 0 unless s == a
    calc(ss[i..-1], as[1..-1])
  end.sum % R
  $cache_calc[[ss,as]]
end

puts calc(S.split(''), 'atcoder'.split(''))

