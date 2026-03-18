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

N, M = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)
Q = STDIN.gets.chomp.to_i
XS = (1..Q).map do
  STDIN.gets.chomp.to_i
end


xis = XS.map.with_index { |x, i| [x - 1, i] }.sort_by { |x, i| x }

cs = Array.new(M, 0)
AS.each do |a|
  cs[a - 1] += 1
end
c_max = cs.max

ds = {}
cs.each.with_index do |c, a|
  ds[c] ||= []
  ds[c] << a
end

pp(xis:, cs:, c_max:, ds:) if $debug


def calc(xis, cs, c_max, ds)
  xias = xis

  k = 0
  while xias[k][0] < N
    x = xias[k][0]
    xias[k][2] = AS[x] - 1
    k += 1
  end

  # seg = AcLibraryRb::Segtree.new(M, 0) { |x, y| x + y }

  as = []
  used = N
  (0..c_max).each do |j|
    if ds[j]
      if ds[j].length <= 2
        ds[j].each do |d|
          v = as.bsearch_index { |a| d < a }
          if v
            as.insert(v, d)
          else
            as << d
          end
        end
      else
        as += ds[j]
        as.sort!
      end

      # ds[j].each do |d|
      #   seg.set(d, 1)
      #   v = seg.prod(0, d)
      #   as.insert(v, d)
      # end
    end
    l = as.length

    while k < Q && xias[k][0] < used + l
      x = xias[k][0]
      xias[k][2] = as[x - used]
      k += 1
    end
    used += l
  end

  as = (0...M).to_a
  while k < Q
    x = xias[k][0]
    xias[k][2] = as[(x - used) % M]
    k += 1
  end

  xias
end


xias = calc(xis, cs, c_max, ds)
pp(xias:) if $debug

xias.sort_by { |x, i, a| i }.each do |x, i, a|
  puts a + 1
end





