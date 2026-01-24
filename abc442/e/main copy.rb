#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

# pq = AcLibraryRb::PriorityQueue.new

# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

N, Q = STDIN.gets.chomp.split.map(&:to_i)
XYS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end
ABS = (1..Q).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


def calc
  xyris = XYS.map.with_index do |(x, y), i|
    if x == 0
      [x, y, nil, i]
    else
      [x, y, Rational(y, x), i]
    end
  end

  pp(xyris:) if $debug

  xyris_x_0_y_plus = xyris.select { |x, y, r, i| x == 0 && 0 < y }
  xyris_x_0_y_minus = xyris.select { |x, y, r, i| x == 0 && y < 0 }

  xyris_x_plus = xyris.select { |x, y, r, i| 0 < x }
  xyris_x_minus = xyris.select { |x, y, r, i| x < 0 }

  xyris_x_plus.sort! do |(x0, y0, r0, i0), (x1, y1, r1, i1)|
    y1 <=> y0
  end

  xyris_x_minus.sort! do |(x0, y0, r0, i0), (x1, y1, r1, i1)|
    y0 <=> y1
  end


  xyris.sort! do |(x0, y0, r0, i0), (x1, y1, r1, i1)|
    if x0 == 0 || x1 == 0
      if x0 == 0 && x1 == 0
        next 0 if (0 < y0 && 0 < y1) || (y0 < 0 && y1 < 0)
        next -1 if y0 < 0 && 0 < y1
        next 1 if 0 < y0 && y1 < 0
      end

      if x0 == 0
        if 0 < y0
          next -1
        else
          next 0 < x1 ? 1 : -1
        end
      end

      if x1 == 0
        if 0 < y1
          next 1
        else
          next 0 < x0 ? -1 : 1
        end
      end
    end

    next 1 if 0 < x0 && x1 < 0
    next -1 if 0 < x1 && x0 < 0

    if 0 < x0 && 0 < x1
      next r1 <=> r0
    else
      next r0 <=> r1
    end
  end


  pp(xyris:) if $debug

end



calc