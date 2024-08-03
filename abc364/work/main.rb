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


def check(as, i, b, k)
  return -1 if N <= i + k - 1

  d = [(b - as[i]).abs, (b - as[i + k - 1]).abs].max

  if 0 < i
    if (b - as[i - 1]).abs < d
      return -1
    end
    if b < as[i] && b < as[i - 1] # as[i]とas[i - 1]がbからみて右側
      return -2
    end
  end

  if i + k - 1 < N - 1
    if (b - as[i + k - 1 + 1]).abs < d
      return 1
    end
    if as[i + k - 1] < b && as[i + k - 1 + 1] < b # as[i + k - 1]とas[i + k - 1 + 1]がbからみて左側
      return 2
    end
  end

  0
end

def find(as, b, k)
  d = N - 1
  i = 0

  # (0...N).each do |i|
  #   c = check(as, i, b, k)
  #   pp ['test, ', 'b: ', b, 'k: ', k, 'i: ', i, 'c: ', c] if $debug
  # end

  while true
    c = check(as, i, b, k)
    pp ['i: ', i, 'c: ', c] if $debug
    return i if c == 0
    d = d / 2
    d = 1 if d == 0
    if 0 < c
      i += d
    else
      i -= d
    end
  end
end

def search(as, b, k)
  i = find(as, b, k)

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
