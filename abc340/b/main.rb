
q = gets.chomp.to_i

as = []
(1..q).each do
  i, a = gets.chomp.split.map(&:to_i)
  if i == 1
    x = a
    as << x
  else
    k = a
    puts as[-k]
  end
end
