#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

N = STDIN.gets.chomp.to_i
S = STDIN.gets.chomp


def create_cs(s)
  s.split('0').map(&:length)
end

def calc()
  s = S.gsub(/\A0+1/, '1').gsub(/10+\Z/, '1')

  cs = create_cs(s)
  # cs_r = create_cs(s.reverse)

  pp({cs:}) if $debug

  r = 0
  i = 0
  j = cs.length - 1
  while i < j
    if cs[i] < cs[j]
      r += cs[i]
      cs[i + 1] += cs[i]
      i += 1
    else
      r += cs[j]
      cs[j - 1] += cs[j]
      j -= 1
    end
  end

  r
end



puts calc



