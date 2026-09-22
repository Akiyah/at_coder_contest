#!/usr/bin/env ruby

require 'rblineprof'
require 'rblineprof-report'

target = /#{Dir.pwd}\/./

profile = lineprof(target) do
  n = 5 * 10 ** 5

  (10 ** 5).times do |t|
    i0 = rand(n)
    i1 = rand(n)
    i2 = rand(n)
    i3 = rand(n)
    i4 = rand(n)
    v1 = [i0, i1, i2, i3, i4].max
    v2 = [i4, i3, i2, i1, i0].max
    vs1 = [i0, i1, i2, i3, i4]
    vs2 = [i4, i3, i2, i1, i0]
    v3 = vs1.max
    v4 = vs2.max
    pp(t:, v1:, v2:, v3:, v4:) unless [v1, v2, v3, v4].uniq.length == 1
  end
end

LineProf.report(profile)
