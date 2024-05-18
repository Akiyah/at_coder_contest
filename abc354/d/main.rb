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

# inf = (1 << 60) - 1
# seg_max = AcLibraryRb::Segtree.new(rs, -inf) { |x, y| [x, y].max }


A, B, C, D = STDIN.gets.chomp.split.map(&:to_i)


dx = (A / 4) * 4
dy = (B / 2) * 2

a, c = A - dx, C - dx
b, d = B - dy, D - dy
# a = 0, 1
# b = 0, 1

pp [a, b, c, d] if $debug


def calc(a, b)
  a4 = a / 4
  b2 = b / 2

  m = a4 * b2 * 8

  a_ = a % 4
  b_ = b % 2


  if a_ == 0
  elsif a_ == 1
    m += b2 * 3
  elsif a_ == 2
    m += b2 * 6
  else # a_ == 3
    m += b2 * 7
  end

  if b_ == 0
  else # b_ == 1
    m += a4 * 4
    if a_ == 0
    elsif a_ == 1
      m += 2
    elsif a_ == 2
      m += 3
    else # a_ == 3
      m += 3
    end
  end

  m
end


def calc2(a, b, c, d)
  m = calc(c, d)
  m -= calc(a, d)
  m -= calc(c, b)
  m += calc(a, b)
  m
end



puts calc2(a, b, c, d)
