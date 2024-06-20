
# require "ac-library-rb/segtree"

$debug = !ARGV[0].nil?

N = STDIN.gets.chomp.to_i
AS = STDIN.gets.chomp.split.map(&:to_i)
Q = STDIN.gets.chomp.to_i
BS = (1..Q).map do
  STDIN.gets.chomp.to_i
end

def calc(b, as)
  i = as.find_index { |a| b < a }

  return b - as[-1] if i == nil

  return as[0] - b if i == 0

  [as[i] - b, b - as[i - 1]].min
end

as = AS.sort
BS.each do |b|
  puts calc(b, as)
end


