#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


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


N, M, Sx, Sy = STDIN.gets.chomp.split.map(&:to_i)

XYS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

DCS = (1..M).map do
  d, c = STDIN.gets.chomp.split
  [d, c.to_i]
end


xys = {}
yxs = {}
XYS.each do |x, y|
  xys[x] ||= []
  xys[x] << y
  yxs[y] ||= []
  yxs[y] << x
end

xys.each do |x, ys|
  ys.sort!
end
yxs.each do |y, xs|
  xs.sort!
end


pp xys if $debug
pp yxs if $debug

# exit

def home_xs(yxs, y, x1, x2)
  xs = yxs[y]
  return [] if xs == nil

  i1 = xs.bsearch_index {|x| x1 <= x }
  i2 = xs.bsearch_index {|x| x2 < x }

  return [] if i1 == nil
  return [] if i2 == 0

  # i2 ||= xs.length - 1
  if i2 == nil
    i2 = xs.length - 1
  else
    i2 = i2 - 1
  end

  rs = xs[i1..i2]
  xs = xs[0...i1] + (xs[(i2 + 1)..] || [])
  rs || []
end

def home_ys(xys, x, y1, y2)
  ys = xys[x]
  return [] if ys == nil

  i1 = ys.bsearch_index {|y| y1 <= y }
  i2 = ys.bsearch_index {|y| y2 < y }

  return [] if i1 == nil
  return [] if i2 == 0

  # i2 ||= ys.length - 1
  if i2 == nil
    i2 = ys.length - 1
  else
    i2 = i2 - 1
  end

  rs = ys[i1..i2]
  ys = ys[0...i1] + (ys[(i2 + 1)..] || [])
  rs || []
end

homes_x = {}
homes_y = {}
x, y = Sx, Sy
DCS.each do |d, c|
  pp [d, c] if $debug
  if d == 'U'
    rs =  home_ys(xys, x, y, y + c)
    pp rs if $debug
    homes_x[x] ||= []
    homes_x[x] += rs
    # rs.each { |r| homes[x] ||= {}; homes[x][r] = 1}
    y += c
  end
  if d == 'D'
    rs = home_ys(xys, x, y - c, y)
    pp rs if $debug
    homes_x[x] ||= []
    homes_x[x] += rs
    # homes += rs.map { |r| [x, r]}
    #rs.each { |r| homes[x] ||= {}; homes[x][r] = 1}
    y -= c
  end
  if d == 'L'
    rs = home_xs(yxs, y, x - c, x)
    pp rs if $debug
    # homes += rs.map { |r| [r, y]}
    homes_y[y] ||= []
    homes_y[y] += rs
    # rs.each { |r| homes[r] ||= {}; homes[r][y] = 1}
    x -= c
  end
  if d == 'R'
    rs = home_xs(yxs, y, x, x + c)
    pp rs if $debug
    # homes += rs.map { |r| [r, y]}
    homes_y[y] ||= []
    homes_y[y] += rs
    # rs.each { |r| homes[r] ||= {}; homes[r][y] = 1}
    x += c
  end
end





pp homes_x if $debug
pp homes_y if $debug

homes = []
homes_x.each do |x, ys|
  ys.uniq.each { |y| homes << [x, y] }
end
homes_y.each do |y, xs|
  xs.uniq.each { |x| homes << [x, y] }
end

c = homes.uniq.length
puts [x, y, c].join(' ')
