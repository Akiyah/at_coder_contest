$debug = !ARGV[0].nil?

N, K = STDIN.gets.chomp.split(' ').map(&:to_i)
PS = STDIN.gets.chomp.split(' ').map(&:to_i)



def calc_steps
  ps = PS
  pp ['ps', ps] if $debug
  paires = []
  data = []
  (1..(N - K)).each do |i|
    data[i] = []
    ((i + K)..N).each do |j|
      paires << [i, j]
      data[i][j] = [ps[i - 1], ps[j - 1], ps[j - 1] - ps[i - 1]]
    end
  end
  pp paires if $debug
  pp ['data', data] if $debug

  steps = []
  while 0 < paires.size
    pair = paires.select { |i, j| data[i][j][2] < 0 }.sort_by { |i, j| data[i][j][2] }.last
    i, j = pair
    break if pair.nil?

    pp ['pair', pair] if $debug
    pp ['data[i][j]', data[i][j]] if $debug

    steps << pair
    paires.delete(pair)
    ps[i - 1], ps[j - 1] = ps[j - 1], ps[i - 1]

    pp ['ps', ps] if $debug

    (1..(N - K)).each do |i_|
      if data[i_] &&  data[i_][j]
        data[i_][j] = [ps[i_ - 1], ps[j - 1], ps[j - 1] - ps[i_ - 1]]
      end
    end
    ((i + K)..N).each do |j_|
      if data[i][j_]
        data[i][j_] = [ps[i - 1], ps[j_ - 1], ps[j_ - 1] - ps[i - 1]]
      end
    end
    pp ['data', data] if $debug
  end

  steps
end

steps = calc_steps
puts steps.length
steps.each do |i, j|
  puts [i, j].join(' ')
end
