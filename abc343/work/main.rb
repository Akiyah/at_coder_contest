N, Q = gets.chomp.split.map(&:to_i)
AS = gets.chomp.split.map(&:to_i)
QUERYS = (1..Q).map do
  gets.chomp.split.map(&:to_i)
end

as = AS.clone

QUERYS.each do |q0, q1, q2|
  if q0 == 1
    p = q1
    x = q2
    as[p - 1] = x
  else
    l = q1
    r = q2
    v2 = as[(l - 1)..(r - 1)].uniq.sort[-2]
    puts as[(l - 1)..(r - 1)].count(v2)
  end
end
