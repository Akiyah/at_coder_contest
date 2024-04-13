# require "ac-library-rb/segtree"

$debug = !ARGV[0].nil?

S = STDIN.gets.chomp

data = S.chars.group_by(&:itself).map { |k, v| [k, v.size] }

result = (1..S.length).to_a.all? do |l|
  pp l if $debug
  m = data.select { |c, n| n == l }.count
  pp m if $debug
  m == 0 || m == 2
end

puts result ? "Yes" : "No"