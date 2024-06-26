
# require "ac-library-rb/segtree"

$debug = !ARGV[0].nil?

N = STDIN.gets.chomp.to_i
S = STDIN.gets.chomp

R = 10 ** 9 + 7

def calc(ss, as)
  if as.length == 0
    return 1
  end

  a = as[0]
  ss.map.with_index do |s, i|
    next 0 unless s == a
    calc(ss[i..-1], as[1..-1])
  end.sum % R
end

puts calc(S.split(''), 'atcoder'.split(''))

