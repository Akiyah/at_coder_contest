
def random_check
  # n = 1 + rand(10**5 - 1)
  # n = 1 + rand(30 - 1)

  n = 1 + rand(15 - 1)
  m = if 1 < n
    1 + rand([n, 10].min - 1)
  else
    1
  end

  # n = [10, 11, 12, 13, 14, 15].sample
  # m = 10

  abs = (1..n).to_a.map do |a|
    (1..n).to_a.map do |b|
      "#{a} #{b}"
    end
  end.flatten.sample(m)

  # abs = Array.new(n) { (1..n).to_a }.sample(m)
  # as = (1..n).to_a.sample(m)
  # bs = (1..n).to_a.sample(m)
  pp [n, m, abs]

  File.open('input.txt', 'w') do |f|
    f.puts "#{n} #{m}"
    # (1..m).each do |i|
    #   f.puts "#{as[i - 1]} #{bs[i - 1]}"
    # end
    abs.each do |ab|
      f.puts ab
    end
  end

  command = "ruby main.rb < input.txt > actual/actual.txt"
  `#{command}`


  File.open('input.txt') do |fi|
    File.open('actual/actual.txt') do |fa|
      n, m = fi.gets.chomp.split.map(&:to_i)
      abs = (1..m).map do
        fi.gets.chomp.split.map(&:to_i)
      end
    
      l = fa.gets.chomp.to_i
      xys = (1..l).map do
        fa.gets.chomp.split.map(&:to_i)
      end
    
      return false unless l == m * n
      return false unless ((xys & abs) - (abs)).empty? # xysはabsを含んでいる
      return false unless xys.length == xys.uniq.length # xysは同じものを含んでいない
    
      xs = xys.group_by{ |x,y| x }.transform_values(&:length)
      return false unless xs.keys.sort == (1..n).to_a
      return false unless xs.all? { |k, v| v == m }
    
      ys = xys.group_by{ |x,y| y }.transform_values(&:length)
      return false unless ys.keys.sort == (1..n).to_a
      return false unless ys.all? { |k, v| v == m }
    end
  end

  true
end


while random_check
  putc '.'
end



