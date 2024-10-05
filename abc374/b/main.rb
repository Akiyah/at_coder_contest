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

S = STDIN.gets.chomp
T = STDIN.gets.chomp


def check
  return 0 if S == T

  n = [S.length, T.length].max
  pp n if $debug
  (0...n).each do |i|
    pp [i, S[i], T[i]] if $debug
    unless S[i] == T[i]
      return i + 1
    end
  end

  0
end


puts check

