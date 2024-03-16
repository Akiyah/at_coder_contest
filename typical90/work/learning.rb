N = 3
L = 6

c = (1...L).to_a.combination(N).count
pp c
(1...L).to_a.combination(N).each.with_index do |ns, i|
  # puts "#{i}/#{c}" if i % 100 == 0
  pp ns

  k_as = (1..3).map do |k|
    mm = ns.combination(k).map { |as| as.min }.max
    # pp mm
    mm_as = ns.combination(k).select { |as| as.min == mm }
    mm_as.first
  end

  # pp k_as
  if (0...1).all? { |i| k_as[i + 1].intersection(k_as[i]).count != k_as[i].count }
    pp ns
  end
end
