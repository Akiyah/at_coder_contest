# require "ac-library-rb/segtree"

$debug = !ARGV[0].nil?

S = STDIN.gets.chomp

l = S.length

ss = (0..(l - 1)).map do |i|
  (i..(l - 1)).map do |j|
    S[i..j]
  end
end

puts ss.flatten.compact.uniq.count
