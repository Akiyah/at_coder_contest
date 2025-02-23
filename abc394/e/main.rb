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
CS = (1..N).map do
  STDIN.gets.chomp.split('')
end


pp({N:, CS:}) if $debug


def update(ss, rs, cs, d)
  #ss2 = []
  ss2 = {}
  updated = false
  ss.each do |i, js|
    js.each do |j, _|
      cs.each do |c, csc|
        i2s = csc[:desc][i] || []
        j2s = csc[:asc][j] || []
        i2s.each do |i2|
          j2s.each do |j2|
            unless rs[i2][j2]
              rs[i2][j2] = d
              updated = true
              ss2[i2] ||= {}
              ss2[i2][j2] = true
            end
          end
        end
      end
    end
  end

  return [ss2, updated]
end

def calc
  cs = {} # char => i => [j]
  (0...N).each do |i|
    (0...N).each do |j|
      c = CS[i][j]
      next if c == '-'
      cs[c] ||= { asc: {}, desc: {}}
      cs[c][:asc][i] ||= []
      cs[c][:desc][j] ||= []
      cs[c][:asc][i] << j
      cs[c][:desc][j] << i
    end
  end
  pp({cs:}) if $debug

  rs = Array.new(N) { Array.new(N) }

  # 0歩
  ss_even = {}
  (0...N).each do |i|
    rs[i][i] = 0
    # ss_even[i][j] = 0
    ss_even[i] ||= {}
    ss_even[i][i] = true
    # ss_even << [i, i, 0]
  end
  # pp({rs:, ss:}) if $debug

  # 1歩
  # ss_odd = []
  ss_odd = {}
  cs.each do |c, csc|
    csc[:asc].each do |i, js|
      js.each do |j|
        unless rs[i][j]
          rs[i][j] = 1
          ss_odd[i] ||= {}
          ss_odd[i][j] = true
          # ss_odd << [i, j, 1]
        end
      end
    end
  end
  # pp({rs:, ss:}) if $debug

  pp({'ss_even.length' => ss_even.length, 'ss_even.uniq.length' => ss_even.uniq.length}) if $debug
  pp({'ss_odd.length' => ss_odd.length, 'ss_odd.uniq.length' => ss_odd.uniq.length}) if $debug

  # 2歩以降
  updated_even = true
  updated_odd = true
  d = 2
  while updated_even || updated_odd
    ss_even, updated_even = update(ss_even, rs, cs, d)
    pp({'ss_even.length' => ss_even.length, 'ss_even.uniq.length' => ss_even.uniq.length, updated_even:}) if $debug
    ss_odd, updated_odd = update(ss_odd, rs, cs, d + 1)
    pp({'ss_odd.length' => ss_odd.length, 'ss_odd.uniq.length' => ss_odd.uniq.length, updated_odd:}) if $debug
    d += 2
  end

  rs
end


rs = calc
rs.each do |line|
  puts line.map {|r| r || -1}.join(' ')
end

