require "ac-library-rb/priority_queue"

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end

N, M = STDIN.gets.chomp.split.map(&:to_i)
ABS = (1..M).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

pp ABS if $debug

rotations_i = []
rotations_j = []
pp ABS.group_by { |a, b| a } if $debug
i = 0
vs = []
ABS.group_by { |a, b| a }.sort_by { |k, v| v.length }.each do |k, v|
  pp [k, v] if $debug
  i += 1
  vs = (vs + v.map { |a, b| b }).uniq
  i = vs.length if i < vs.length
  pp ['rotations_i', i, k, vs] if $debug
  rotations_i << [i, k]

  v.each do |a, b|
    unless rotations_j.include?(b)
      pp ['rotations_j', b] if $debug
      rotations_j << b
    end
  end
end

pp rotations_i if $debug
pp rotations_j if $debug

ni = (1..N).to_a
rotations_i.reverse.each do |i, k|
  ni[i - 1], ni[k - 1] = ni[k - 1], ni[i - 1]
end

nj = rotations_j + ((1..N).to_a - rotations_j)

pp ni if $debug
pp nj if $debug

pp '---' if $debug
N.times do |j|
  M.times do |i|
    puts [(j + i) % N + 1, j + 1].join(" ") if $debug
  end
end



pp '---' if $debug

puts N * M
result = []
N.times do |j|
  M.times do |i|
    result << [ni[(j + i) % N], nj[j]]
  end
end

result.each do |r|
  puts r.join(" ")
end

if $debug
  data = []
  N.times do |i|
    data[i] = []
    N.times do |j|
      data[i][j] = '.'
    end
  end

  result.each do |r|
    a, b = r
    data[a - 1][b - 1] = '1'
  end

  puts '----'
  N.times do |i|
    puts data[i].join(" ")
  end
end
