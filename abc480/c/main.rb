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

N, K, T = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)


as = AS.sort




l = 0
ans = 0
as.each do |a|
  pp(a:, l:) if $debug
  if T <= a
    if T <= l
    else # l < a
      d = (T - l)
      if d % K == 0
        ans += d / K
      else
        ans += (d / K) + 1
      end
    end
    l = a + K
    break
  end

  if a <= l
  else # l < a
    d = (a - l)
    if d % K == 0
      ans += d / K
    else
      ans += (d / K) + 1
    end
  end
  pp(ans:, l:) if $debug

  l = a + K
end

pp(ans:, l:) if $debug

if T <= l
else # l < a
  d = (T - l)
  if d % K == 0
    ans += d / K
  else
    ans += (d / K) + 1
  end
end


puts ans





