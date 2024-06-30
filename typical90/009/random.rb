while true

  n = (1..7).to_a.sample
  b = (1..30).to_a.sample
  k = (1..9).to_a.sample
  cs = (1..9).to_a.combination(k).to_a.sample

  pp [n, b, k, cs]

  File.open('input.txt', 'w') do |f|
    f.puts [n, b, k].join(' ')
    f.puts cs.join(' ')
  end

  `ruby main.rb < input.txt > actual/actual.txt`
  `ruby main_simple.rb < input.txt > actual/actual_simple.txt`

  r = `diff actual/actual.txt actual/actual_simple.txt`
  pp r
  
  exit if 0 < r.length
end

# [1, 4, 7, [1, 2, 5, 6, 7, 8, 9]]
# "1c1\n" + "< 77\n" + "---\n" + "> 1\n"


# [1, 24, 8, [1, 3, 4, 5, 6, 7, 8, 9]]
# "1c1\n" + "< 917\n" + "---\n" + "> 0\n"

# [3, 16, 6, [1, 2, 4, 5, 6, 9]]
# "1c1\n" + "< 486\n" + "---\n" + "> 16\n"