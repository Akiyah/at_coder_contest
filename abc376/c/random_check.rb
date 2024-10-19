
def random_check
  n = 1 + rand(2 * 10 ** 5)
  hs = (1..n).to_a.shuffle

  File.open('input.txt', 'w') do |f|
    f.puts n
    f.puts hs.join(' ')
  end

  command = "ruby main.rb < input.txt > actual/actual.txt"
  `#{command}`

  command2 = "ruby main_simple.rb < input.txt > actual/actual_simple.txt"
  `#{command2}`

  actual = File.read('actual/actual.txt')
  actual_simple = File.read('actual/actual_simple.txt')

  if actual != actual_simple
    puts "actual: #{actual}"
    puts "actual_simple: #{actual_simple}"
    return false
  end

  true
end


while random_check
  putc '.'
end



