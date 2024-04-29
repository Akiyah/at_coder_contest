pp ARGV

def check(i)
  input_file = "input#{i}.txt"
  actual_file = "actual/actual#{i}.txt"

  command = "ruby main.rb < #{input_file} > #{actual_file}"
  pp command
  `#{command}`

  File.open(input_file) do |fi|
    File.open(actual_file) do |fa|
      yield fi, fa
    end
  end
end

ARGV.each do |i|
  r = check(i) do |fi, fa|
    n, m = fi.gets.chomp.split.map(&:to_i)
    abs = (1..m).map do
      fi.gets.chomp.split.map(&:to_i)
    end

    l = fa.gets.chomp.to_i
    xys = (1..l).map do
      fa.gets.chomp.split.map(&:to_i)
    end

    pp [n, m, abs]
    pp [l, xys]

    next 'NG1' unless l == m * n
    next 'NG2' unless xys & abs == abs # xysはabsを含んでいる
    next 'NG3' unless xys.length == xys.uniq.length # xysは同じものを含んでいない

    xs = xys.group_by{ |x,y| x }.transform_values(&:length)
    next 'NG4' unless xs.keys.sort == (1..n).to_a
    next 'NG5' unless xs.all? { |k, v| v == m}

    ys = xys.group_by{ |x,y| y }.transform_values(&:length)
    next 'NG6' unless ys.keys.sort == (1..n).to_a
    next 'NG7' unless ys.all? { |k, v| v == m}

    'OK'
  end
  puts r
end
