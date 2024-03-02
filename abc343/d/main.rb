N, T = gets.chomp.split.map(&:to_i)
ABS = (1..T).map do
  gets.chomp.split.map(&:to_i)
end

scores = Array.new(N, 0)
score_variations = {}
score_variations[0] = N
score_variation_keys = 1

ABS.each do |a, b|
  i = scores[a - 1]
  scores[a - 1] += b
  j = scores[a - 1]

  score_variations[i] -= 1
  if score_variations[i] == 0
    score_variations.delete(i)
    score_variation_keys -= 1
  end

  if score_variations[j] == nil
    score_variations[j] = 0
    score_variation_keys += 1
  end
  score_variations[j] += 1

  # puts scores.uniq.count
  # puts score_variations.keys.count
  puts score_variation_keys
end


