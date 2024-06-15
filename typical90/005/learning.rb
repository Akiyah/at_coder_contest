
(2..1000).each do |b|
  rs = []
  ijr = nil
  (0..b).each.with_index do |d, j|
    r = (10 ** d) % b
    i = rs.find_index(r)
    if i
      ijr = [i, j, r]
      break
    end
    rs << r
  end
  pp [b, ijr]
end
