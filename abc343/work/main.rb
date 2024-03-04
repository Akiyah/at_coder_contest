require "ac-library-rb/segtree"

N, Q = gets.chomp.split.map(&:to_i)
AS = gets.chomp.split.map(&:to_i)
QUERYS = (1..Q).map do
  gets.chomp.split.map(&:to_i)
end

seg = AcLibraryRb::Segtree.new(N, [[0, 0], [0, 0]]) do |x, y| # 最大値0が0個という意味
  # xとyは [[m1, c1], [m2, c2]] という形。最大値m1がc1個、二番目のm2がc2個、という意味
  # (x + y).uniq.sort.reverse[0..1]

  if x[0][0] == y[0][0]
    x0, x1 = x
    y0, y1 = y
    if x1[0] == y1[0]
      [[x0[0], x0[1] + y0[1]], [x1[0], x1[1] + y1[1]]]
    else
      x1, y1 = y1, x1 if x1[0] < y1[0]
      [[x0[0], x0[1] + y0[1]], [x1[0], x1[1]]]
    end
  else
    x, y = y, x if x[0][0] < y[0][0]

    x0, x1 = x
    y0, y1 = y

    if y0[0] == x1[0]
      [[x0[0], x0[1]], [y0[0], y0[1] + x1[1]]]
    else
      y0, x1 = x1, y0 if y0[0] < x1[0]
      [[x0[0], x0[1]], [y0[0], y0[1]]]
    end
  end
end

AS.each_with_index do |a, i|
  seg.set(i, [[a, 1], [0, 0]])
end

# as = AS.clone

QUERYS.each do |q0, q1, q2|
  if q0 == 1
    p = q1
    x = q2
    # as[p - 1] = x
    seg.set(p - 1, [[x, 1], [0, 0]])
  else
    l = q1
    r = q2
    #v2 = as[(l - 1)..(r - 1)].uniq.sort[-2]
    #puts as[(l - 1)..(r - 1)].count(v2)
    puts seg.prod(l - 1, r)[1][1] # 二番目の値の個数
  end
end
