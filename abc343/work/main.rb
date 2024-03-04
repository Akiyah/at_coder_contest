require "ac-library-rb/segtree"

N, Q = gets.chomp.split.map(&:to_i)
AS = gets.chomp.split.map(&:to_i)
QUERYS = (1..Q).map do
  gets.chomp.split.map(&:to_i)
end

seg = AcLibraryRb::Segtree.new(N, [[0, 0]]) do |x, y| # 最大値0が0個という意味
  # xとyは [[m1, c1], [m2, c2]] という形。最大値m1がc1個、二番目のm2がc2個、という意味
  # (x + y).uniq.sort.reverse[0..1]
  # m1, m2 = (x + y).map { |m, c| m }.uniq.sort.reverse[0..1]
  xy = (x + y).group_by { |m, c| m }
  m1, m2 = xy.keys.sort.reverse[0..1]
  # pp "------"
  # pp [x, y, x + y, xy]
  # pp [m1, m2]
  c1 = xy[m1].sum { |m, c| c }
  if m2
    c2 = xy[m2].sum { |m, c| c }
    # pp [[m1, c1], [m2, c2]]
    [[m1, c1], [m2, c2]]
  else
    # pp [[m1, c1]]
    [[m1, c1]]
  end
end

AS.each_with_index do |a, i|
  seg.set(i, [[a, 1]])
end

# as = AS.clone

QUERYS.each do |q0, q1, q2|
  if q0 == 1
    p = q1
    x = q2
    # as[p - 1] = x
    seg.set(p - 1, [[x, 1]])
  else
    l = q1
    r = q2
    #v2 = as[(l - 1)..(r - 1)].uniq.sort[-2]
    #puts as[(l - 1)..(r - 1)].count(v2)
    puts seg.prod(l - 1, r)[1][1] # 二番目の値の個数
  end
end
