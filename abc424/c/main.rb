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
ABS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

paths = {}
skills = {}
ABS.each_with_index do |(a, b), i|
  if a == 0 && b == 0
    skills[i] = true
  else
    paths[a - 1] ||= {}
    paths[a - 1][i] = true
    paths[b - 1] ||= {}
    paths[b - 1][i] = true
  end
end

def calc(skills, paths)
  is = skills.keys
  while 0 < is.length
    i = is.shift
    next unless paths[i]
    paths[i].keys.each do |j|
      if skills[j]
      else
        skills[j] = true
        is << j
      end
    end
  end
  skills.length
end



puts calc(skills, paths)


