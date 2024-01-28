N = gets.chomp.to_i
AS = gets.chomp.split.map(&:to_i)

last1s = Array.new(1 + 10, nil)
last2s = Array.new(1 + 10) { Array.new(1 + 10, nil) }
paires = {}

AS.each_with_index do |a, i|
  (1..10).each do |b|
    c = b - (a - b)
    if 1 <= c && c <= 10
      kj = last2s[c][b]
      if kj
        k, j = kj
        paires[k] ||= []
        paires[k] << i
        last2s[c][b] = nil
      end
    end
  end

  (1..10).each do |b|
    j = last_is[b] 
    if j
      if !table[b][a]
        table[b][a] = i
        d = AS[i] - AS[j]
        paires[d] ||= {}
        # paires[d][j] ||= []
        paires[d][j] = i
      end
    end
  end

  last1s[a] = i




  table[a] = Array.new(1 + 10, nil)
end

pp last_is
pp table
pp paires


ranges = []
paires.each do |d, ijs|
  ijs.each do |i, j|
    ranges << [i, ijs[j]] if ijs[j]
  end
end

pp ranges



