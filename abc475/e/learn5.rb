#!/usr/bin/env ruby

pp(RUBY_VERSION:)

require 'rblineprof'
require 'rblineprof-report'

target = /#{Dir.pwd}\/./

profile = lineprof(target) do
  n = 5 * 10 ** 5

  10000.times do |t|
    i = rand(n)
    j = rand(n)
    m1 = i < j ? j : i
    m2 = [i, j].max
    pp(m1:, m2:) unless m1 == m2
  end
end

LineProf.report(profile)
