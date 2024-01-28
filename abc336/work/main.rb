N = gets.chomp.to_i
NS = N.to_s.split('').map(&:to_i)
NL = NS.length

# pp [N, NS, NL]

ans = 0
(1..(9 * NL)).each do |s|
  data = []
  data[0] ||= []
  data[0][0] ||= []
  data[0][0][0] ||= []
  data[0][0][0][1] = 1

  NL.times do |d|
    data[d] ||= []

    (s + 1).times do |i|
      data[d][i] ||= []

      s.times do |j|
        data[d][i][j] ||= []

        [1, 0].each do |f|
          data[d][i][j][f] ||= 0

          [10, [0, s - i + 1].max].min.times do |t|
            # next if i + t > s
            next if (f == 1) && (NS[d] < t)

            f2 = ((f == 1) && (NS[d] == t) ? 1 : 0)

            data[d + 1] ||= []
            data[d + 1][i + t] ||= []
            data[d + 1][i + t][(j * 10 + t) % s] ||= []
            data[d + 1][i + t][(j * 10 + t) % s][f2] ||= 0

            data[d + 1][i + t][(j * 10 + t) % s][f2] += data[d][i][j][f]
          end
        end
      end
    end
  end

  ans += (data[NL][s][0][0] || 0) + (data[NL][s][0][1] || 0)
end

puts ans
