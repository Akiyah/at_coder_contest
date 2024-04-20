# require "ac-library-rb/segtree"

$debug = !ARGV[0].nil?

S = STDIN.gets.chomp
n = S[-3..-1].to_i

if n == 316 || n == 0 || 350 <= n
  puts 'No'
else
  puts 'Yes'
end
