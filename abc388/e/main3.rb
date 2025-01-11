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


N = STDIN.gets.chomp.to_i
AS = STDIN.gets.chomp.split.map(&:to_i)

def calc
  useds = Array.new(N, false)

  j = 0
  r = 0
  AS.each_with_index do |a, i|
    pp [a, i, useds, useds[i], j, r] if $debug
    next if useds[i]

    dj = AS[(j + 1)..].bsearch_index { |b| a * 2 <= b }
    pp ({dj:}) if $debug
    if dj == nil
      return r
    end

    r += 1
    j = j + 1 + dj
    useds[j] = true
  end

  r
end


def calc_s
  as = AS.reverse
  useds = Array.new(N, false)

  j = 0
  r = 0
  as.each_with_index do |a, i|
    pp [a, i, useds, useds[i], j, r] if $debug
    next if useds[i]

    dj = as[(j + 1)..].bsearch_index { |b| b * 2 <= a }
    pp ({dj:}) if $debug
    if dj == nil
      return r
    end

    r += 1
    j = j + 1 + dj
    useds[j] = true
  end

  r
end


puts [calc, calc_s].max

