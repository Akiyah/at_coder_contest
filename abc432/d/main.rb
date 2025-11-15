#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
require "ac-library-rb/dsu"

# pq = AcLibraryRb::PriorityQueue.new

# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

N, X, Y = STDIN.gets.chomp.split.map(&:to_i)
CABS = (1..N).map do
  c, a, b = STDIN.gets.chomp.split
  [c, a.to_i, b.to_i]
end

pp(N:, X:, Y:, CABS:) if $debug

def cut(area, c, a, b)
  p0, p1 = area
  x0, y0 = p0
  x1, y1 = p1
  if c == 'X'
    if x0 < a && a < x1
      [
        [[x0, y0 - b], [a, y1 - b]],
        [[a, y0 + b], [x1, y1 + b]],
      ]
    else
      if x0 < a
        [
          [[x0, y0 - b], [x1, y1 - b]],
        ]
      else
        [
          [[x0, y0 + b], [x1, y1 + b]],
        ]
      end
    end
  else # c == 'Y'
    if y0 < a && a < y1
      [
        [[x0 - b, y0], [x1 - b, a]],
        [[x0 + b, a], [x1 + b, y1]],
      ]
    else
      if y0 < a
        [
          [[x0 - b, y0], [x1 - b, y1]],
        ]
      else
        [
          [[x0 + b, y0], [x1 + b, y1]],
        ]
      end
    end
  end
end


def grouping(areas)
  l = areas.length
  dsu = AcLibraryRb::DSU.new(l)

  (0...l).each do |i1|
    (x10, y10), (x11, y11) = areas[i1]
    ((i1 + 1)...l).each do |i2|
      unless dsu.same?(i1, i2)
        (x20, y20), (x21, y21) = areas[i2]
        pp(i1:, i2:) if $debug
        pp(areas[i1], areas[i2]) if $debug
        if !(x21 <= x10 || x11 <= x20) && (y21 == y10 || y20 == y11)
          dsu.merge(i1, i2)
          pp('merge') if $debug
        end
        if (x21 == x10 || x20 == x11) && !(y21 <= y10 || y11 <= y20)
          dsu.merge(i1, i2)
          pp('merge') if $debug
        end
      end
    end
  end

  dsu.groups
end




def calc_groups

  areas = []
  areas << [[0, 0], [X, Y]]

  CABS.each do |c, a, b|
    pp(c:, a:, b:) if $debug
    new_areas = []
    areas.each do |area|
      pp(area:) if $debug
      new_areas += cut(area, c, a, b)
      pp(new_areas:) if $debug
    end
    areas = new_areas
  end

  pp(areas:) if $debug

  groups = grouping(areas)

  pp(groups:) if $debug

  rs = []
  groups.each do |group|
    rs << group.map do |i|
      # pp(areas[i])
      (x0, y0), (x1, y1) = areas[i]
      r = (x1 - x0) * (y1 - y0)
      # pp r
      r
    end.sum
  end
  
  rs.sort
end



rs = calc_groups
puts rs.length
puts rs.join(' ')


