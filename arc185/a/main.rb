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

T = STDIN.gets.chomp.to_i
NMS = (1..T).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

def calc(n, m)
  s = n * (n + 1)

  if $debug
    pp [n, m]
    pp [s, (s - n) / m, (s - 1) / m]
    pp [s, (s - n) % m, (s - 1) % m]
    pp !(1..n).any? { |b| (s - b) % m == 0 }
    pp !((s - n) / m != (s - 1) / m || (s - 1) % m == 0 || (s - n) % m == 0)
    #pp (s - n) / m == (s - 1) / m
  end
  # return !(1..n).any? { |b| (s - b) % m == 0 }
  return !((s - n) / m != (s - 1) / m || (s - 1) % m == 0 || (s - n) % m == 0)
end


NMS.each do |n, m|
  puts calc(n, m) ? 'Alice' : 'Bob'
end
