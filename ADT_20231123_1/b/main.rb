data = (1..2).map do
  gets.split
end

line = data.map { |s| s.join('') }.join('')

if line == '#..#' ||  line == '.##.'
  puts 'No'
else
  puts 'Yes'
end