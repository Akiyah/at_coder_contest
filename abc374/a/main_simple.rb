# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end


N = STDIN.gets.chomp.to_i
HS = STDIN.gets.chomp.split.map(&:to_i)



rs = (0...N).map do |i|
  h = 0
  c = 0
  HS[(i + 1)..-1].each do |j|
    if h < j
      c += 1
      h = j
    end
  end
  c
end

puts rs.join(' ')
