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

# N = STDIN.gets.chomp.to_i
N, H, M = STDIN.gets.chomp.split.map(&:to_i)
ABS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

def update(h, m, m_max_by_h, h_max_by_m)
  return false if h < 0
  return false if m < 0

  return false if m_max_by_h[h] && m < m_max_by_h[h]
  return false if h_max_by_m[m] && h < h_max_by_m[m]

  m_max_by_h[h] = m
  h_max_by_m[m] = h
  true
end

def calc
  m_max_by_h_old = { H => M }
  h_max_by_m_old = { M => H }

  r = 0
  ABS.each do |a, b|
    # pp(r:, l: hms.length) if $debug
    # hms_new = []
    updated = false
    m_max_by_h = {}
    h_max_by_m = {}
    m_max_by_h_old.each do |h, m|
      if update(h - a, m, m_max_by_h, h_max_by_m)
        updated = true
      end
      if update(h, m - b, m_max_by_h, h_max_by_m)
        updated = true
      end
    end

    return r unless updated

    # hms = hms_new
    m_max_by_h_old = m_max_by_h
    h_max_by_m_old = h_max_by_m
    r += 1
  end

  r
end




puts calc
