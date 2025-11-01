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

N, A, B = STDIN.gets.chomp.split.map(&:to_i)
S = STDIN.gets.chomp

def calc
  ss = S.chars
  sum = 0
  r = 0
  la = 0
  lb = 0

  ca = 0
  cb = 0
  ca2 = 0
  cb2 = 0

  N.times do |r|
    s = ss[r]
    pp(s:) if $debug
    if s == 'a'
      ca += 1
      if A - 1 < ca
        while !(A - 1 == ca - ca2)
          if ss[la] == 'a'
            ca2 += 1
          end
          la += 1
          pp(la:, A:, ca:, ca2:) if $debug
        end
      end
    else # s == 'b'
      cb += 1
      if B - 1 < cb
        while !(cb - cb2 == B - 1)
          if ss[lb] == 'b'
            cb2 += 1
          end
          lb += 1
          pp(lb:) if $debug
        end
      end
    end

    if A - 1 == ca - ca2 && B - 1 == cb - cb2
      if 0 < la - lb
        sum += la - lb
      end
    end
    pp(r:, la:, lb:, ca:, cb:, ca2:, cb2:, sum:) if $debug
  end
  sum
end




puts calc
