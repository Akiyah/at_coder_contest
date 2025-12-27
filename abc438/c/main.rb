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
AS = STDIN.gets.chomp.split.map(&:to_i)



def calc(as)
  return N if N < 4

  js = []
  as.each do |a|
    js << a
    if 4 <= js.length && js[-1] == js[-2] && js[-1] == js[-3] && js[-1] == js[-4]
      js.pop
      js.pop
      js.pop
      js.pop
    end
  end
  js.length
end



puts calc(AS.dup)

