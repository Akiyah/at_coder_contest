#!/usr/bin/env ruby

require 'rblineprof'
require 'rblineprof-report'

target = /#{Dir.pwd}\/./

profile = lineprof(target) do
  n = 5 * 10 ** 5

  1000000.times do |t|
    i = rand(n)
    j = rand(n)
    k = rand(n)
    i += 1
    j += 1
    k += 1
    vs1 = [i, j, k]
    vs2 = [k, j, i]
    v1 = vs1.max
    v2 = vs2.max
    pp(v1:, v2:) unless v1 == v2
  end
end

LineProf.report(profile)
