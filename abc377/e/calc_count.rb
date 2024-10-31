#!/usr/bin/env ruby

require 'prime'


def calc_count_simple(m, k)
  (2 ** m) % k  
end




def calc_count(m, k)
  # pp "calc_count(#{m}, #{k})"
  return 0 if k == 1

  # ms = m.prime_division.to_h
  ks = k.prime_division.to_h
  if ks[2]
    if m < ks[2]
      2 ** m
    else
      calc_count(m - ks[2], k / (2 ** ks[2])) * (2 ** ks[2])
    end
  else
    # オイラー関数
    f = ks.map { |p, i| (p - 1) * p ** (i - 1) }.inject(:*)
    # pp f
    (2 ** (m % f)) % k
  end
end

(1..20).each do |k|
  (1..20).each do |m|
    r1 = calc_count_simple(m, k)
    r2 = calc_count(m, k)
    unless r1 == r2
      pp [m, k, r1, r2]
    else
      # pp '-'
    end
  end
end
