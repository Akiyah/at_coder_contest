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
CS = STDIN.gets.chomp.split.map(&:to_i)
KAS = (1..M).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


animals = []
KAS.each.with_index do |(k, *as), i|
  pp [k, as] if $debug
  as.each do |a|
    animals[a - 1] ||= []
    animals[a - 1] << i
  end
end

pp animals if $debug

zoos = animals.map { |is| is.map {|i| 2**i}.sum  }

pp zoos if $debug


def calc_one(zs, zoos, animals)
  cost = 0

  s = 0
  s2 = 0
  zs.each.with_index do |z, i|
    if 0 < z
      cost += CS[i] * z
    end

    if z == 1
      t = zoos[i] || 0
      s2 |= s & t
      s |= t
    end

    if z == 2
      t = zoos[i] || 0
      s2 |= t
      s |= t
    end
    pp({z:, i:, s:, s2:}) if $debug
  end

  if s2 == 2 ** M - 1
    cost
  else
    nil
  end
end


def calc(zoos, animals)
  rs = []
  (0...(3 ** N)).each do |z|
    zs = z.to_s(3).split('').map(&:to_i).reverse
    r = calc_one(zs, zoos, animals)
    pp({r:, z:, zs:}) if $debug
    if r
      rs << r
    end
  end
  rs.min
end


puts calc(zoos, animals)


