N = gets.chomp.to_i

M = Math.log(N, 2).ceil
puts M

dss = []

M.times do |i|
  d = 2 ** i
  array = [1] * d + [0] * d
  array = (array * 100)[0...N]

  k = array.count(1)
  ds = array.map.with_index { |a, i| a == 1 ? i + 1 : nil }.compact
  dss << ds

  puts ds.length.to_s + ' ' + ds.join(' ')
end
STDOUT.flush

#pp dss

S = gets.chomp
ss = S.split('')

#pp ss

ps = (1..N).to_a
dss.each.with_index do |ds, i|
  #pp [ds, i, ss[i]]
  if ss[i] == '1'
    ps = ps.intersection(ds) 
  else
    ps = ps.intersection((1..N).to_a - ds)
  end
  #pp ps
end

puts ps[0]
STDOUT.flush
