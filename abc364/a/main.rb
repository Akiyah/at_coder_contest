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
SS = (1..N).map do
  STDIN.gets.chomp
end


def calc
  return 'Yes' if N == 1 || N == 2

  (0...(N-2)).each do |i|
    s1 = SS[i]
    s2 = SS[i+1]
    return 'No' if s1 == 'sweet' &&  s2 == 'sweet'
  end

  return 'Yes' 
end

r = calc
puts r
