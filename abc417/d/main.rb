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

N = STDIN.gets.chomp.to_i
PABS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end
Q = STDIN.gets.chomp.to_i
XS = (1..Q).map do
  STDIN.gets.chomp.to_i
end



def calc_xiss(xiss, p, a, b)
  new_xiss = []
  merged_xis_zero = []
  xiss.each do |h|
    xis = h[:xis]
    d = h[:d]
    x = h[:x]
    if x # すでにひとつの値に収束している場合
      if x <= p
        x += a
      else
        x -= b
        x = 0 if x < 0
      end
      new_xiss << { xis:, d:, x: }
    else # まだひとつの値に収束していない場合
      if b < p # 0になるものがない
        s = xis.bsearch_index { |x2, i2| p < x2 + d } # down
        # t = xis.bsearch_index { |x2, i2| b < x2 + d } # down & 0に収束しない
        xis_up = s ? xis[0...s] : xis
        xis_down = s ? xis[s..] : []
        if 0 < xis_up.length
          if xis_up.length == 1
            new_xiss << { xis: xis_up, d: nil, x: xis_up[0][0] + d + a}
          else
            new_xiss << { xis: xis_up, d: d + a, x: nil}
          end
        end
        if 0 < xis_down.length
          if xis_down.length == 1
            new_xiss << { xis: xis_down, d: d - b, x: xis_down[0][0] + d - b}
          else
            new_xiss << { xis: xis_down, d: d - b, x: nil}
          end
        end
      else # 0になるものがある可能性
        s = xis.bsearch_index { |x2, i2| p < x2 + d } # down
        t = xis.bsearch_index { |x2, i2| b < x2 + d } # down & 0に収束しない
        xis_up = s ? xis[0...s] : xis
        if t # tがあればsもある
          xis_zero = xis[s...t]
          xis_down = xis[t..]
        else
          xis_zero = s ? xis[s..] : []
          xis_down = []
        end
        if 0 < xis_up.length
          if xis_up.length == 1
            new_xiss << { xis: xis_up, d: d + a, x: xis_up[0][0] + d + a}
          else
            new_xiss << { xis: xis_up, d: d + a, x: nil}
          end
        end
        if 0 < xis_down.length
          if xis_down.length == 1
            new_xiss << { xis: xis_down, d: d - b, x: xis_down[0][0] + d - b}
          else
            new_xiss << { xis: xis_down, d: d - b, x: nil}
          end
        end
        merged_xis_zero << xis_zero if 0 < xis_zero.length
      end
    end
  end
  new_xiss << { xis: merged_xis_zero.flatten(1), d: nil, x: 0 } if 0 < merged_xis_zero.length
  new_xiss
end

def calc_xis(xis)
  xiss = [{xis: xis, d: 0, x: nil}]
  pp(xiss:) if $debug
  PABS.each do |p, a, b|
    xiss_new = calc_xiss(xiss, p, a, b)
    xiss = xiss_new
    pp(xiss:, p:, a:, b:) if $debug
  end
  xirs = []
  xiss.each do |h|
    xis = h[:xis]
    d = h[:d]
    x = h[:x]
    if x
      xis.each do |x2, i2|
        xirs << [x2, i2, x]
      end
    else
      xis.each do |x2, i2|
        xirs << [x2, i2, x2 + d]
      end
    end
  end
  xirs
end

def calc
  xis = XS.map.with_index { |x, i| [x, i] }
  pp(xis:) if $debug
  xis = xis.sort_by { |x, i| x }
  pp(xis:) if $debug
  xirs = calc_xis(xis)
  pp(xirs:) if $debug

  xirs = xirs.sort_by { |x, i, r| i }
  xirs.each do |x, i, r|
    puts r
  end
end



calc
