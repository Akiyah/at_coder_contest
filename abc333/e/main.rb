n = gets.chomp.to_i

txs = (1..n).map do
  gets.chomp.split(' ').map(&:to_i)
end

# pp txs

data = {}
txs.each_with_index do |tx, i|
  data[tx[1]] ||= []
  data[tx[1]] << [tx[0], i]
end

# pp data

game = 0
data.each do |x, d|
  life = 0
  d.reverse.each do |ti|
    t = ti[0]
    i = ti[1]
    if t == 1 # ポーション
      if life < 0
        ti << 1 # ひろう
        life += 1
      else
        ti << 0 # ひろわない（不要）
      end
    else # モンスター
      life -= 1
      ti << -1 # ポーションを失う
    end
  end
  if life < 0
    game = -1
  end
end

if game == -1
  puts -1
else
  # pp data
  play = []
  data.each do |x, d|
    play += d
  end
  play = play.sort { |tia| tia[1] }

  po = 0
  max_po = 0
  play.each do |tia|
    if tia[2] == 1
      po += 1
      max_po = [max_po, po].max
    end
    if tia[2] == -1
      po -= 1
    end
  end

  puts max_po
  result = play.map do |tia|
    if tia[0] != 1
      nil
    else
      tia[2]
    end
  end
  puts result.compact.join(' ')


end

