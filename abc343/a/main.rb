A, B = gets.chomp.split.map(&:to_i)

x = (0..9).to_a
x.delete(A + B)
puts x.min