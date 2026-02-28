#!/usr/bin/env ruby

# p = 7

# 100.times do |a|
#   100.times do |b|
#     pp(a:, b:, p:) unless (a % p).lcm(b % p) % p == a.lcm(b) % p 
#   end
# end

# {a: 2, b: 8, p: 7}


N = 10 ** 7

require 'rblineprof'
require 'rblineprof-report'

# カレントディレクトリ以下のRubyファイルを対象にする
target = /#{Dir.pwd}\/./

# profile = lineprof(target) do
  t1 = Time.now

  $lpf = (0..(N)).to_a
  primes = []
  (2..(N)).each do |x|
    primes << x if $lpf[x] == x
    primes.each do |p|
      break if N < p * x || $lpf[x] < p
      $lpf[p * x] = p
    end
  end

  t2 = Time.now

  $spf = (0..(N)).to_a
  (2..Math.sqrt(N)).each do |i|
    # pp(i:, spf: $spf[..20]) if $debug && i <= 20
    if $spf[i] == i
      #((i * i)..(N)).step(i).each do |j|
      ((i * i)..N).step(i) do |j|
        $spf[j] = i if $spf[j] == j
      end
    end
  end

  t3 = Time.now
# end
# LineProf.report(profile)



unless $lpf == $spf
  pp($lpf[..20])
  pp($spf[..20])
end

pp(t1:, t2:, t3:)
pp(t2 - t1)
pp(t3 - t2)
