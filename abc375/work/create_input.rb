N = 100
B_MAX = 1500

def create
  abs = []

  (1..N).each do |i|
    abs << [rand(3) + 1, rand(30) + 1]
  end

  return nil unless abs.sum { |a, b| b } <= B_MAX
  return nil unless abs.sum { |a, b| b } % 3 == 0

  abs
end


abs = create
while !abs
  abs = create
end

puts abs.length
abs.each { |a, b| puts [a, b].join(' ') }
