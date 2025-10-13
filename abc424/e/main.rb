#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 

require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"


# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

T = STDIN.gets.chomp.to_i


# def calc_next(as, n, k, x, bs, bn)
#   a0 = as[0]
#   i = as.bsearch_index { |a| a < a0 * 0.5 }

#   if i + 1 <= k && bn + (i + 1) <= x
#     k -= i + 1
#     x -= bn + (i + 1)

#     bs.unshift(as[...i])
#     bn = bn + (i + 1)
#     as = as[i..]

#   end



#   if k - 1 < i && x - 1 < i
#     bs.unshift(as[...i])


#     as = as[i..]
#     return 
#   end


#   [false, as, n, k, x, bs, bn]
# end


# def calc_pq(as_2, n, k, x, as, j, k0, k1, ais)

#   k.times do |t|
#     ais << [as[t], j]
#   end

#   pq = AcLibraryRb::PriorityQueue.new(ais) { |(a, i), (b, j)| a * 2 ** i > b * 2 ** j }

  

# end


def search_pq(pq, x)
  x2 = x
  while true
    a, i = pq.pop
    if i < x2
      x2 -= i
    else
      return a
    end
  end
end

def create_pq(ais, k2)
  pq = AcLibraryRb::PriorityQueue.new(ais) do |(a0, i0), (a1, i1)|
    a0 > a1
  end
  pp(pq:) if $debug

  while 0 < k2
    a, i = pq.pop
    if i < k2
      k2 -= i
      pq.push([a / 2, i * 2])
    else
      pq.push([a / 2, k2 * 2])
      pq.push([a, i - k2]) if 0 < i - k2
      k2 = 0
    end
  end

  pq
end

def create_ais(ass, k)
  j = 0
  m = 0
  k2 = k
  l = (ass[j] || []).length
  while m * 2 + l < k2
    j += 1
    k2 -= m * 2 + l
    m = m * 2 + l

    l = (ass[j] || []).length
  end

  ais = []
  ass.each_with_index do |as, i|
  # (0..j).each do |i|
    next unless as
    if i < j
      ais += as.map { |a| [a.to_r / 2 ** (j - i), 2 ** (j - i)] }
    else
      ais += as.map { |a| [a.to_r, 1] }
    end
  end

  pp(ais:, k2:, m:) if $debug
  return [ais, k2]
end

def create_ass(as)
  as = as.sort.reverse

  ass = [[]]
  a0 = as[0]
  j = 0
  as.each do |a|
    while a * (2 ** (j + 1)) <= a0
      j += 1
      ass << []
    end
    ass[-1] << a
  end

  ass
end

def calc
  n, k, x = STDIN.gets.chomp.split.map(&:to_i)
  as = STDIN.gets.chomp.split.map(&:to_i)
  pp(n:, k:, x:, as:) if $debug

  ass = create_ass(as)
  pp(ass:) if $debug

  ais, k2 = create_ais(ass, k)
  pp(ais:, k2:) if $debug

  pq = create_pq(ais, k2)
  pp(pq:) if $debug

  search_pq(pq, x)
end

T.times do
  r = calc
  puts sprintf('%.20f', r)
end

