# require "ac-library-rb/segtree"

$debug = !ARGV[0].nil?

N, K = STDIN.gets.chomp.split.map(&:to_i)
S = STDIN.gets.chomp

s_min = S[0...K]
S.split('').combination(K).each do |ss|
  s = ss.join('')
  s_min = s if s < s_min
end

puts s_min
