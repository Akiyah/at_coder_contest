
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
    if as.length == i
      d1 = (bs[j][0] - as[i - 1]).abs
      if 1 < i
        d2 = (bs[j][0] - as[i - 2]).abs
        bs[j][2] = [d1, d2].min
      else
        bs[j][2] = d1
      end
      j += 1
      next
    end

    if as[i] < bs[j][0]
      i += 1
      next
    end

    d1 = (bs[j][0] - as[i]).abs
    if 0 < i
      d2 = (bs[j][0] - as[i - 1]).abs
      bs[j][2] = [d1, d2].min
    else
      bs[j][2] = d1
    end
    j += 1
  end

  pp bs if $debug
  bs.sort_by { |b, i, d| i }.map { |b, i, d| d }
end

rs = calc(BS, AS)
rs.each { |r| puts r }

