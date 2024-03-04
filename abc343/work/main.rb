require "ac-library-rb/segtree"

N, Q = gets.chomp.split.map(&:to_i)
AS = gets.chomp.split.map(&:to_i)
QUERYS = (1..Q).map do
  gets.chomp.split.map(&:to_i)
end

seg = AcLibraryRb::Segtree.new(AS.map {|a| [a, 1, 0, 0] }, [0, 0, 0, 0]) do |x, y| # 最大値0が0個という意味
  # xとyは [m1, c1, m2, c2] という形。最大値m1がc1個、二番目のm2がc2個、という意味

  x0, x1, x2, x3 = x
  y0, y1, y2, y3 = y

  if x0 == y0
    if x2 == y2
      [x0, x1 + y1, x2, x3 + y3]
    else
      if x2 < y2
        [x0, x1 + y1, y2, y3]
      else
        [x0, x1 + y1, x2, x3]
      end
    end
  else
    if y0 < x0
      if y0 == x2
        [x0, x1, y0, y1 + x3]
      else
        if y0 < x2
          [x0, x1, x2, x3]
        else
          [x0, x1, y0, y1]
        end
      end
    else # x0 < y0
      if x0 == y2
        [y0, y1, x0, x1 + y3]
      else
        if x0 < y2
          [y0, y1, y2, y3]
        else
          [y0, y1, x0, x1]
        end
      end
    end
  end
end

# AS.each_with_index do |a, i|
#   seg.set(i, [a, 1, 0, 0])
# end

# as = AS.clone

QUERYS.each do |q0, q1, q2|
  if q0 == 1
    p = q1
    x = q2
    # as[p - 1] = x
    seg.set(p - 1, [x, 1, 0, 0])
  else
    l = q1
    r = q2
    #v2 = as[(l - 1)..(r - 1)].uniq.sort[-2]
    #puts as[(l - 1)..(r - 1)].count(v2)
    puts seg.prod(l - 1, r)[3] # 二番目の値の個数
  end
end
