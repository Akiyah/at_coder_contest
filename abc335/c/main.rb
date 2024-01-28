n, q = gets.chomp.split.map(&:to_i)

dragon = (1..n).map do |i|
  [i, 0]
end

queries = (1..q).map do |x|
  gets.chomp.split
end
# pp queries

queries.each do |t, c|
  # pp dragon
  if t == '1'
    head = dragon[0].clone
    if c == 'R'
      head[0] += 1
    elsif c == 'L'
      head[0] += -1
    elsif c == 'U'
      head[1] += 1
    elsif c == 'D'
      head[1] += -1
    end
    dragon.unshift(head)
    dragon.pop
  else
    p = c.to_i
    puts dragon[p - 1].join(' ')
  end
end

# pp dragon
