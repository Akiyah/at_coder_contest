H, W, N = gets.chomp.split.map(&:to_i)

data = Array.new(H) { Array.new(W, '.') }

t = {x: 0, y: 0, d: [0, -1]}

# pp data
(1..N).each do |i|
  #pp i
  #pp t
  # # pp t[:x]
  # # pp t[:y]
  # pp data[t[:y]][t[:xs]]
  if data[t[:y]][t[:x]] == '.'
    data[t[:y]][t[:x]] = '#'
    # # pp t
    # # pp t[:d]
    # # pp t[:d] == [0, -1]
    if t[:d] == [0, -1] # up
      t[:d] = [1, 0]
    elsif t[:d] == [0, 1] # down
      t[:d] = [-1, 0]
    elsif t[:d] == [-1, 0] # left
      t[:d] = [0, -1]
    else # t[:d] == [1, 0] # right
      t[:d] = [0, 1]
    end
    t[:x] += t[:d][0]
    t[:y] += t[:d][1]
  else
    data[t[:y]][t[:x]] = '.'
    if t[:d] == [0, -1] # up
      t[:d] = [-1, 0]
    elsif t[:d] == [0, 1] # down
      t[:d] = [1, 0]
    elsif t[:d] == [-1, 0] # left
      t[:d] = [0, 1]
    else # t[:d] == [1, 0] # right
      t[:d] = [0, -1]
    end
    t[:x] += t[:d][0]
    t[:y] += t[:d][1]
  end

  # pp t
  t[:x] = (t[:x] + W) % W
  t[:y] = (t[:y] + H) % H
  # pp t

  # pp data
end

data.each do |row|
  puts row.join
end
