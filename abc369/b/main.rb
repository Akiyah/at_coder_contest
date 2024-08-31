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
ASS = (1..N).map do
  a, s = STDIN.gets.chomp.split
  [a.to_i, s]
end


c = 0
l = nil
r = nil
ASS.each do |a, s|
  if s == 'L'
    if l != nil
      c += (l - a).abs
    end
    l = a
  else
    if r != nil
      c += (r - a).abs
    end
    r = a
  end
end

puts c
