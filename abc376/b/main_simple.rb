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
ABS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

def calc(abs)
  s = abs.map { |a, b| b}.sum
  return -1 unless s % 3 == 0

  r = -1
  (0...(3 ** N)).each do |i|
    is = i.to_s(3).rjust(N, '0').chars.map(&:to_i)
    c = 0 # 変更数
    x = [0, 0, 0]
    abs.each_with_index do |(a, b), j|
      c += 1 unless a == is[j] + 1
      x[is[j]] += b
    end
    if x[0] == s / 3 && x[1] == s / 3 && x[2] == s / 3
      r = c if r == -1
      r = c if c < r
    end
  end

  return r
end

puts calc(ABS)


