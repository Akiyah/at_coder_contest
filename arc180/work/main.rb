$debug = !ARGV[0].nil?

N, K = STDIN.gets.chomp.split(' ').map(&:to_i)
PS = STDIN.gets.chomp.split(' ').map(&:to_i)



def calc_steps_one(a, ps)
  steps = []
  i = ps.find_index(a) + 1
  bjs = ps.zip(1..N).select { |b, j| j <= i - K && a < b }.sort_by { |b, j| b }
  pp ['bjs', bjs] if $debug
  bjs.each do |b, j|
    steps << [j, i]
    ps[i - 1], ps[j - 1] = ps[j - 1], ps[i - 1]
  end
  steps
end


def calc_steps
  ps = PS
  steps = []

  (1..N).to_a.reverse.each do |a|
    pp ['a', a] if $debug
    steps_one = calc_steps_one(a, ps)
    pp ['steps_one', steps_one] if $debug
    steps += steps_one
  end

  steps
end

steps = calc_steps
puts steps.length
steps.each do |i, j|
  puts [i, j].join(' ')
end
