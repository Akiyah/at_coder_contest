#!/usr/bin/env ruby

$spf = (0..(10 ** 7)).to_a
(2..Math.sqrt(10 ** 7)).each do |i|
  # pp(i:, spf: $spf[..20]) if $debug && i <= 20
  if $spf[i] == i
    ((i * i)..(10 ** 7)).step(i) do |j|
      $spf[j] = i if $spf[j] == j
    end
  end
end

puts($spf.join(','))
