# require "ac-library-rb/priority_queue"

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end

N, X, Y, Z = STDIN.gets.chomp.split.map(&:to_i)


((X < Z && Z < Y) || (Y < Z && Z < X)) ? puts("Yes") : puts("No")
