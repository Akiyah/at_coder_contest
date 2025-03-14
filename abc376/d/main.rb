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

N, M = STDIN.gets.chomp.split.map(&:to_i)
ABS = (1..M).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


paths = {}
ABS.each do |a, b|
  paths[a - 1] ||= []
  paths[a - 1] << b - 1
end

def calc(paths)
  vs = [0]
  cs = [nil] * N
  cs[0] = 0

  loop do
    return -1 if vs.empty?

    v = vs.shift

    if paths[v]
      paths[v].each do |v2|
        return cs[v] + 1 if v2 == 0
        if cs[v2] == nil
          cs[v2] = cs[v] + 1
          vs << v2
        end
      end
    end
  end
end

puts calc(paths)
