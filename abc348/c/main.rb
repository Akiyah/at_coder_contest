# require "ac-library-rb/segtree"

$debug = !ARGV[0].nil?

# A, B, C = STDIN.gets.chomp.split.map(&:to_i)
N = STDIN.gets.chomp.to_i
ACS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

data = {}
(0...N).each do |i|
  ai, ci = ACS[i]

  if data[ci].nil?
    data[ci] = ai
  else
    if ai < data[ci]
      data[ci] = ai
    end
  end
end

puts data.values.max
