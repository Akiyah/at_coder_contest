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

X = STDIN.gets.chomp.to_i


def f(x)
  r = 0
  # pp(x:, r:)
  while x.index('ARC')
    x = x.sub('ARC', 'CRA')
    # pp(x:, r:)
    r += 1
  end
  r
end

# def calc(x)
#   return 'A' if x == 0

#   p = x / 25 # 0 - 24
#   q = 25

#   x2 = x - p * q # 0 - 24


#   ans = ''
#   pp(ans:) if $debug
#   ans += ('AR' * p) + ('C' + 'RC' * (q - 25)) if 0 < p
#   pp(ans:) if $debug
#   ans += ('AR' * x2) + 'C'
#   pp(ans:) if $debug

#   ans
# end

def calc(x)
  # pp(x:)
  return 'A' if x == 0

  ans = ''

  p = x / 25

  x2 = x - p * 25

  if 0 < x2
    ans += 'AR' * x2 + 'CR' + ('AR' * (25 - x2))
  else
    ans += 'AR' * 25
  end

  ans += 'CR' * p
  # pp(ans:) if $debug

  ans
end


pp(X:) if $debug
ans = calc(X)
pp(ans:) if $debug
pp('f(x)': f(ans)) if $debug
puts ans



