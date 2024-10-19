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
  paths[a] ||= Set.new
  paths[a] << b
end

def calc(paths)
  vs = Set[1]
  visited_vs = Set.new

  i = 0
  loop do
    pp [vs, visited_vs] if $debug
    next_vs = Set.new

    vs.each do |v|
      next if visited_vs.include?(v)
      visited_vs << v
      if paths[v]
        return (i + 1) if paths[v].include?(1)
        next_vs += paths[v]
      end
    end


    pp next_vs if $debug
    return -1 if next_vs.empty?

    # visited_vs += vs

    i += 1
    vs = next_vs
  end
end

puts calc(paths)
