N = gets.chomp.to_i
QS = gets.chomp.split.map(&:to_i)
AS = gets.chomp.split.map(&:to_i)
BS = gets.chomp.split.map(&:to_i)




def check(n, qs, as, bs)
  max_ma = (0...n).map { |i| as[i] == 0 ? nil : qs[i] / as[i] }.compact.min
  ms = (0..max_ma).map do |ma|
    mb = (0...n).map { |i| bs[i] == 0 ? nil : (qs[i] - as[i] * ma) / bs[i] }.compact.min
    ma + mb
  end
  ms.length == 0 ? 0 : ms.max
end

puts check(N, QS, AS, BS)
