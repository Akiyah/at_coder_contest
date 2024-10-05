
def random_check
  # n = 1 + rand(2 * 10 ** 5)
  n = 1 + rand(2 * 10 ** 2)
  hs = (1..n).to_a.shuffle

  File.open('input.txt', 'w') do |f|
    f.puts n
    f.puts hs.join(' ')
  end

  command = "ruby main.rb < input.txt"
  actual = `#{command}`

  command2 = "ruby main_simple.rb < input.txt"
  actual_simple = `#{command2}`

  puts "actual:\n#{actual}"
  puts "actual_simple:\n#{actual_simple}"

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



