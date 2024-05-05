require "ac-library-rb/priority_queue"

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

abs = ABS.map { |a, b| [a - 1, b - 1] }
ks = abs.map { |a, b| (a + b) % N }.uniq

pp ks if $debug

if ks.size < M
  ks += ((0...N).to_a - ks)[0...(M - ks.size)]
end

pp ks if $debug

results = []
ks.each do |k|
  (0...N).each do |i|
    results << [i, (k - i + N) % N]
  end
end

puts N * M
results.each do |a, b|
  puts "#{a + 1} #{b + 1}"
end
