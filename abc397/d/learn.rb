#!/usr/bin/env ruby


require 'prime'
# pd = Prime.prime_division(a)
$debug = !ARGV[0].nil?

td_max = 0
((10**18)..1).step(-1).each do |a|
  t1 = Time.now
  pd = Prime.prime_division(a)
  t2 = Time.now
  td = t2 - t1
  if td_max < td
    pp({a:, pd:, td:})
    td_max = td
  end
end


