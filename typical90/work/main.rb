
# require "ac-library-rb/segtree"

$debug = !ARGV[0].nil?

N = STDIN.gets.chomp.to_i
AS = STDIN.gets.chomp.split.map(&:to_i)
Q = STDIN.gets.chomp.to_i
BS = (1..Q).map do
  STDIN.gets.chomp.to_i
end

def calc(bs, as)
  as = as.sort
  bs = bs.zip((0...(bs.length)))
  bs = bs.sort_by { |b, i| b }

  pp as if $debug
  pp bs if $debug

  i = 0
  j = 0

  while j < bs.length
    unless as.length <= i
      bs[j][2] = bs[j][0] - as[-1]
      j += 1
      next
    end

    if as[i] < bs[j][0]
      i += 1
      next
    end

  end

  []
end

rs = calc(BS, AS)
rs.each { |r| puts r }

