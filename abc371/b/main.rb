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
  a, b = STDIN.gets.chomp.split
  [a.to_i, b]
end


baby_ms = []
ABS.each do |a, b|
  if b != 'M'
    puts 'No'
    next
  end

  if baby_ms[a - 1] == nil
    puts 'Yes'
  else
    puts 'No'
  end
  baby_ms[a - 1] ||= []
  baby_ms[a - 1] << b
end

