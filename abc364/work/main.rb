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


def calc
  as = AS.sort
  bkqs = BKS.zip(0...Q).sort_by { |bk, q| bk[0] }

  rs = []
  as_left = []
  as_right = as
  bkqs.map do |bk, q|
    pp ['bk:', bk, 'q:', q] if $debug
    b, k = bk
    i = as_right.find_index { |a| b < a }
    if i.nil?
      as_left = as.reverse
      as_right = []
    else
      as_left = as_right[0...i].reverse + as_left
      as_right = as_right[i..]
    end

    pp [as_left, as_right] if $debug

    il = 0
    ir = 0
    cs = nil
    (1..k).each do |j|
      pp ['j:', j, 'cs:', cs] if $debug
      if as_left.length <= il
        cs = (as_right[ir] - b)
        ir += 1
        next
      end
      if as_right.length <= ir
        cs = (b - as_left[il])
        il += 1
        next
      end
      if (b - as_left[il]) < (as_right[ir] - b)
        cs = (b - as_left[il])
        il += 1
      else
        cs = (as_right[ir] - b)
        ir += 1
      end
    end
    pp ['cs:', cs] if $debug
    rs[q] = cs
    pp ['bk:', bk, 'q:', q, 'rs[q]:', rs[q], 'rs:', rs] if $debug
  end
  rs
end

rs = calc
rs.each do |r|
  puts r
end