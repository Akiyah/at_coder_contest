$debug = !ARGV[0].nil?

N, K = STDIN.gets.chomp.split(' ').map(&:to_i)
PS = STDIN.gets.chomp.split(' ').map(&:to_i)



def calc_steps
  ps = PS
  pp ['ps', ps] if $debug
  # paires = []
  d_paires = []
  data = []
  (1..(N - K)).each do |i|
    data[i] = []
    ((i + K)..N).each do |j|
      # paires << [i, j]
      d = -(ps[j - 1] - ps[i - 1])
      if 0 < d
        d_paires[d] ||= []
        d_paires[d] << [i, j]
        data[i][j] = d
      end
    end
  end
  # pp paires if $debug
  pp ['data', data] if $debug
  pp ['d_paires', d_paires] if $debug

  steps = []
  c = 0
  while true
    puts (c += 1)
    # pair = paires.select { |i, j| data[i][j] < 0 }.sort_by { |i, j| data[i][j] }.last
    d = d_paires.find_index do |paires|
      paires && 0 < paires.length
    end
    break unless d
    pair = d_paires[d].shift
    i, j = pair
    pp ['pair', pair] if $debug
    pp ['data[i][j]', data[i][j]] if $debug
    data[i][j] = nil
    # paires.delete(pair)
    # break if pair.nil?


    pp ['data', data] if $debug
    pp ['d_paires:1', d_paires] if $debug
    

    steps << pair
    ps[i - 1], ps[j - 1] = ps[j - 1], ps[i - 1]

    pp ['ps', ps] if $debug

    (1..(j - K)).each do |i_|
      next if i == i_

      d_old = data[i_][j]
      next unless d_old

      d = -(ps[j - 1] - ps[i_ - 1])
      if 0 < d && d != d_old
        d_paires[d_old].delete([i_, j])
        d_paires[d] ||= []
        d_paires[d] << [i_, j]
        data[i_][j] = d
      end
    end

    pp ['data', data] if $debug
    pp ['d_paires:2', d_paires] if $debug

    ((i + K)..N).each do |j_|
      # data[i][j_] = ps[j_ - 1] - ps[i - 1]
      next if j == j_

      d_old = data[i][j_]
      next unless d_old

      d = -(ps[j_ - 1] - ps[i - 1])
      if 0 < d && d != d_old
        d_paires[d_old].delete([i, j_])
        d_paires[d] ||= []
        d_paires[d] << [i, j_]
        data[i][j_] = d
      end
    end
    pp ['data', data] if $debug
    pp ['d_paires:3', d_paires] if $debug
  end

  steps
end

steps = calc_steps
puts steps.length
steps.each do |i, j|
  puts [i, j].join(' ')
end
