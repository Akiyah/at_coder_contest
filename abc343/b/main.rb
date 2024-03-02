N = gets.chomp.to_i
AS = (1..N).map do
  gets.chomp.split.map(&:to_i)
end

lines = []

AS.each_with_index do |row, i|
  row.each_with_index do |a, j|
    next if a == 0
    lines[i + 1] ||= []
    lines[j + 1] ||= []
    lines[i + 1] << j + 1
    lines[j + 1] << i + 1
  end 
end

(1..N).each do |i|
  if lines[i]
    puts lines[i].uniq.sort.join(' ')
  else
    puts
  end
end