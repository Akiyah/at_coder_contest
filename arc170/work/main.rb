N = gets.chomp.to_i
AS = gets.chomp.split.map(&:to_i)

last1s = Array.new(1 + 10, nil)
last2s = Array.new(1 + 10) { Array.new(1 + 10, nil) }
paires = []

k_max = -1

AS.each_with_index do |a, i|
  # c -> b -> a
  # k    j    i
  (1..10).each do |b|
    c = b - (a - b)
    if 1 <= c && c <= 10
      kj = last2s[c][b]
      if kj
        k, j = kj
        if k_max < k
          paires << [k, i]
          last2s[c][b] = nil
          k_max = k
        end
      end
    end
  end

  # b -> a
  # j    i
  (1..10).each do |b|
    j = last1s[b] 
    if j
      last2s[b][a] = [j, i]
    end
  end

  # a
  # i
  last1s[a] = i
end

pp last1s
pp last2s
pp paires




