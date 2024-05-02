require "ac-library-rb/priority_queue"

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end

def r(ns)
  rns = []
  (1..N).each do |k|
    rns[ns[k - 1] - 1] = k
  end
  rns
end

def convert_data(data, nsi, nsj)
  (1..N).map do |a|
    (1..N).map do |b|
      data[nsi[a - 1] - 1][nsj[b - 1] - 1]
    end
  end
end

def convert_points(points, nsi, nsj)
end

def create_river_points
  result = []
  N.times do |j|
    M.times do |i|
      result << [(j + i) % N, j]
    end
  end
  result
end

if $debug
  def print_abs(abs, nsi=(1..N).to_a, nsj=(1..N).to_a)
    rnsi = r(nsi)
    rnsj = r(nsj)

    pp ['nsi', nsi]
    pp ['nsj', nsj]
    pp ['rnsi', rnsi]
    pp ['rnsj', rnsj]
    data = Array.new(N) { ['.'] * N }
    abs.each do |a, b|
      data[a - 1][b - 1] = '@'
    end
    ABS.each do |a, b|
      data[a - 1][b - 1] = (data[a - 1][b - 1] == '.' ? '#' : '1')
    end
    data2 = convert_data(data, nsi, nsj)
    
    puts '-' * 30
    puts '   ' + (1..N).to_a.map{ |j| rnsj[j - 1].to_s.rjust(3) }.join('')
    data.each.with_index do |line, i|
      puts rnsi[i].to_s.rjust(3) + line.map{ |w| '  ' + w }.join('')
    end
    puts '^ ' * 15
    puts '   ' + (1..N).to_a.map{ |j| j.to_s.rjust(3) }.join('')
    data2.each.with_index do |line, i|
      puts (i + 1).to_s.rjust(3) + line.map{ |w| '  ' + w }.join('')
    end
    puts '-' * 30
  end
end

N, M = STDIN.gets.chomp.split.map(&:to_i)
ABS = (1..M).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

pp ABS if $debug
print_abs(ABS) if $debug


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

pp ['ni', ni] if $debug
pp ['nj', nj] if $debug

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

print_abs(result, ni, nj) if $debug
