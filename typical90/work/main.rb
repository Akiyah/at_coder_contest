# require "ac-library-rb/segtree"

$debug = !ARGV[0].nil?

N, K = STDIN.gets.chomp.split.map(&:to_i)
S = STDIN.gets.chomp

ss = S.split('')

ss1 = ss[0...(-K + 1)]
ss2 = ss[(-K + 1)..-1]

rs = []
K.times do |i|
  pp [ss1, ss2, rs] if $debug

  s1 = ss1.min
  rs << s1
  j = ss1.find_index(s1)

  s2 = ss2.shift
  ss1 = ss1[(j + 1)..-1] + [s2]
end

puts rs.join('')
