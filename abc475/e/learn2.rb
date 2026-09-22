#!/usr/bin/env ruby

pp(RUBY_VERSION:)

require 'rblineprof'
require 'rblineprof-report'

target = /#{Dir.pwd}\/./

profile = lineprof(target) do
  n = 5 * 10 ** 5

  1000000.times do |t|
    i = rand(n)
    j = rand(n)
    v1 = i < j ? j : i
    v2 = [i, j].max
    pp(v1:, v2:) unless v1 == v2

    i = rand(n)
    j = rand(n)
    v2 = [i, j].max
    v1 = i < j ? j : i
    pp(v1:, v2:) unless v1 == v2
  end
end

LineProf.report(profile)
