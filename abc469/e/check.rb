#!/usr/bin/env ruby



100.times do |i|
  pp(i:)

  n = 10
  k = rand(1..4)

  as = n.times.map { [0, 1].sample }
  while as.sum < k
    as = n.times.map { [0, 1].sample }
  end

  File.open('test/check.in', 'w') do |f|
    f.puts [n, k].join(' ')
    f.puts as.map{ |a| a == 0 ? 'x' : 'o' }.join('')
  end

  out = `ruby main.rb < test/check.in`
  out_sample = `ruby main_simple.rb < test/check.in`

  if out.to_f != out_sample.to_f
    pp(out:, out_sample:)
    exit
  end
end