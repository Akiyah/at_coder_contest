#!/usr/bin/env ruby


N = 2
M = 3
nms = (1..(N*M)).to_a

anss = {}
nms.permutation do |as|
  bs = N.times.map do |i|
    M.times.map { |j| as[i * M + j] }
  end
  # pp(as:, bs:)
  xs = N.times.map { |i| M.times.map { |j| bs[i][j] }.max }
  ys = M.times.map { |j| N.times.map { |i| bs[i][j] }.max }
  # pp(xs:, ys:)

  anss[xs] ||= {}
  anss[xs][ys] ||= []
  anss[xs][ys] << bs
end

# pp(anss:)


xss = nms.product(*([nms] * (N - 1)))
yss = nms.product(*([nms] * (M - 1)))

# pp(xss:)
# pp(yss:)


xss.each do |xs|
  yss.each do |ys|
    if anss[xs] && anss[xs][ys]
      puts 'Yes'
      anss[xs][ys].first.each do |line|
        puts line.join(' ')
      end
    else
      puts 'No'
    end
  end
end
