#!/usr/bin/env ruby

p = 7

100.times do |a|
  100.times do |b|
    pp(a:, b:, p:) unless (a % p).lcm(b % p) % p == a.lcm(b) % p 
  end
end

# {a: 2, b: 8, p: 7}