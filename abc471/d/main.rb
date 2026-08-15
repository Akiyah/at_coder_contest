#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

pq = AcLibraryRb::PriorityQueue.new

# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

Q, V = STDIN.gets.chomp.split.map(&:to_i)


Q.times do
  type, t, w = STDIN.gets.chomp.split.map(&:to_i)
  if type == 1
    pq << w - t # t=0のときのバッテリー残量とする

  else
    w0 = pq.pop # t=0のときのバッテリー残量が最も大きいもの
    if w0
      w = w0 + t
      puts [w, V].min
    else
      puts -1
    end
  end
end



# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end


