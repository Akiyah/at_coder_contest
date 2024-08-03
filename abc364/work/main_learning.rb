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

N, Q = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)
BKS = (1..Q).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


def count_a(as, b, x)
  k = as.count { |a| (b - a).abs <= x }
  i = as.find_index { |a| (b - a).abs <= x }
  pp ['k: ', k, 'i: ', i] if $debug
  [k, i]
end

def find(as, b, k)
  x = 10 ** 9
  d = x
  k3 = nil

  while true
    pp ['x: ', x, 'd: ', d] if $debug
    k2, i2 = count_a(as, b, x)
    return i2 if k2 == k
    return i2 if x == 0
    if d == 1
      if k3 && (k3 - k) * (k2 - k) < 0
        return i2
      end
    end

    d = d / 2
    d = 1 if d == 0
    if k2 < k
      x += d
    else
      x -= d
    end
    k3, i3 = k2, i2
  end
end

def search(as, b, k)
  i = find(as, b, k)
  pp i if $debug

  d = [(b - as[i]).abs, (b - as[i + k - 1]).abs].max
end

def calc
  as = AS.sort

  rs = []
  BKS.map do |b, k|
    rs << search(as, b, k)
  end
  rs
end

rs = calc
rs.each do |r|
  puts r
end
