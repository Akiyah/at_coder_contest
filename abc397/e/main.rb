#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

# pq = AcLibraryRb::PriorityQueue.new

require 'set'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

N, K = STDIN.gets.chomp.split.map(&:to_i)
UVS = (1...(N * K)).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


paths = {}
singles = Set.new()
doubles = Set.new()
UVS.each do |u, v|
  unless doubles.include?(u)
    if singles.include?(u)
      singles.delete(u)
      doubles.add(u)
    else
      singles.add(u)
    end
  end
  unless doubles.include?(v)
    if singles.include?(v)
      singles.delete(v)
      doubles.add(v)
    else
      singles.add(v)
    end
  end

  paths[u] ||= []
  paths[u] << v
  paths[v] ||= []
  paths[v] << u
end

pp singles if $debug
pp doubles if $debug
pp paths if $debug


def calc(singles, doubles, paths)
  return false if N < singles.length




  true
end



if calc(singles, doubles, paths)
  puts 'Yes'
else
  puts 'No'
end
