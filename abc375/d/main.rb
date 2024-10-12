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

ss = S.split('')
n = ss.length

ss2 = ss.zip((0...n))

ss3 = ss2.group_by { |s, i| s }

pp ss3 if $debug



def calc_one(is)
  r = 0

  s = is[0]
  p = 1

  is[1..].each do |i|
    r += p * (i - 1) - s

    s += i
    p += 1
  end

  r
end

def calc(ss3)
  ss3.map do |k, ss|
    is = ss.map { |s, i| i }
    calc_one(is)
  end.sum
end

puts calc(ss3)


