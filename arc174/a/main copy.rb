require "ac-library-rb/segtree"

$debug = !ARGV[0].nil?

N, C = STDIN.gets.chomp.split.map(&:to_i)
#AS = (1..N).map { STDIN.gets.chomp.split.map(&:to_i) }.sort_by { |a, b| -a * b }
AS = STDIN.gets.chomp.split.map(&:to_i)
# pp AS

as = AS
c = C


left_sum = 0
left_m = as[0]
left_i = 0
(0...N).each do |i|
  a = as[i]
  left_sum += a

  if 0 < C
    if left_m < left_sum
      left_m = left_sum
      left_i = i
    end
  else
    if left_m > left_sum
      left_m = left_sum
      left_i = i
    end
  end
end

right_sum = 0
right_m = as[left_i]
right_i = left_i
(0..left_i).each do |i|
  j = left_i - i
  b = as[j]
  right_sum += b

  if 0 < C
    if right_m < right_sum
      right_m = right_sum
      right_i = j
    end
  else
    if right_m > right_sum
      right_m = right_sum
      right_i = j
    end
  end

  pp [j, right_sum, right_m, right_i] if $debug
end



pp [left_i, right_i] if $debug

result0 = AS.sum

result1 = AS[0...right_i].sum + AS[right_i..left_i].sum * C + AS[(left_i + 1)..-1].sum

puts [result0, result1].max
