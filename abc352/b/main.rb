# require "ac-library-rb/priority_queue"

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end

S = STDIN.gets.chomp
T = STDIN.gets.chomp

ss = S.split('')
ts = T.split('')

result = []
ts.each.with_index do |t, i|
  if ss[0] == t
    result << i + 1
    ss.shift
  end
end

puts result.join(' ')