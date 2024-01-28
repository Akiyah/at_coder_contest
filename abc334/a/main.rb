b, g = gets.chomp.split(' ').map(&:to_i)
puts b > g ? 'Bat' : 'Glove'