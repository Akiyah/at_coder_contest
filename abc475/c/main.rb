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

N, S, L = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)
pp(AS:) if $debug


ds = [0]
d = 0
AS.each do |a|
  d += a
  ds << d
end
pp(ds:) if $debug

def calc_left(ds)
  s = S - 1
  i = s
  j = N - 1

  r = 1
  d_s = ds[s]
  while 0 <= i
    pp(s:, i:, r:) if $debug
    di = ds[i]

    while L < (d_s - di) + (ds[j] - di)
      j -= 1
      if j <= s
        return r
      end
    end

    pp(j:) if $debug

    r1 = (j - i) + 1
    r = r1 if r < r1
    i -= 1
  end

  r
end

def calc_right(ds)
  s = S - 1
  i = s
  j = 0

  r = 1
  d_s = ds[s]
  while i < N
    di = ds[i]

    while L < (di - d_s) + (di - ds[j])
      j += 1
      if s <= j
        return r
      end
    end

    r1 = (i - j) + 1
    r = r1 if r < r1
    i += 1
  end

  r
end

def calc_center(ds)
  s = S - 1
  d_s = ds[s]

  i = 0
  rl = 1
  while i <= s
    if (d_s - ds[i]) <= L
      r1 = s - i + 1
      rl = r1 if rl < r1
    end
    i += 1
  end

  i = N - 1
  rr = 1
  while s <= i
    if (ds[i] - d_s) <= L
      r1 = i - s + 1
      rr = r1 if rr < r1
    end
    i -= 1
  end


  pp(rl:, rr:) if $debug
  [rl, rr].max
end


def calc(ds)
  # left
  al = calc_left(ds)

  # right
  ar = calc_right(ds)

  ac = calc_center(ds)


  pp(al:, ar:, ac:) if $debug
  [al, ac, ar].compact.max
end


puts calc(ds)


