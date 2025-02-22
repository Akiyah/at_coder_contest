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

SS = STDIN.gets.chomp.split('')


def check
  stack = []
  SS.each do |s|
    if s == '('
      stack << s
    elsif s == '['
      stack << s
    elsif s == '<'
      stack << s
    elsif s == ')'
      return false unless stack.pop == '('
    elsif s == ']'
      return false unless stack.pop == '['
    else # s == '>'
      return false unless stack.pop == '<'
    end
  end

  stack.length == 0
end



puts check ? 'Yes' : 'No'




