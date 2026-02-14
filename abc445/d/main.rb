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

H, W, N = STDIN.gets.chomp.split.map(&:to_i)
HWS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end




def calc
  hwibs = HWS.map.with_index { |(h, w), i| [h, w, i, true] }
  hwibs_h = hwibs.sort_by { |h, w, i, b| h }
  hwibs_w = hwibs.sort_by { |h, w, i, b| w }

  pp(hwibs:) if $debug
  pp(hwibs_h:) if $debug
  pp(hwibs_w:) if $debug

  rs = []
  i0 = 0
  j0 = 0
  h0 = H
  w0 = W

  while true
    pp('.') if $debug
    h, w, i, b = hwibs_h[-1]
    while i && !hwibs[i][3]
      hwibs_h.pop
      h, w, i, b = hwibs_h[-1]
      # pp(hwibs_h:, h:, w:, i:, b:) if $debug
    end
    pp(type: 'hwibs_h', h:, w:, i:, b:) if $debug
    if i
      if h == h0
        rs[i] = [i0, j0]
        j0 += w
        w0 -= w
        hwibs[i][3] = false
        pp(rs:) if $debug
        next
      end
    end

    h, w, i, b = hwibs_w[-1]
    while i && !hwibs[i][3]
      hwibs_w.pop
      h, w, i, b = hwibs_w[-1]
    end
    pp(type: 'hwibs_w', h:, w:, i:, b:) if $debug
    if i
      if w == w0
        rs[i] = [i0, j0]
        i0 += h
        h0 -= h
        hwibs[i][3] = false
        pp(rs:) if $debug
        next
      end
    end
    break
  end
  rs
end






rs = calc()
pp(rs:) if $debug
rs.each do |i, j|
  puts [i + 1, j + 1].join(' ')
end







