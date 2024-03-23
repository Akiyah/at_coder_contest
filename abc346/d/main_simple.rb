# require "ac-library-rb/segtree"

$debug = !ARGV[0].nil?

N = STDIN.gets.chomp.to_i
S = STDIN.gets.chomp
CS = STDIN.gets.chomp.split.map(&:to_i)

def calc(ss)
  # 0
  cost_min_0 = (0...(N - 1)).map do |i|
    # i番目とi+1番目が0であるようにする

    cost = 0
    (0..i).each do |j|
      if (i - j) % 2 == 0
        cost += CS[j] if ss[j] != 0
      else
        cost += CS[j] if ss[j] != 1
      end
    end

    ((i + 1)..(N - 1)).each do |j|
      if (j - (i + 1)) % 2 == 0
        cost += CS[j] if ss[j] != 0
      else
        cost += CS[j] if ss[j] != 1
      end
    end

    cost
  end.min

  # 1
  cost_min_1 = (0...(N - 1)).map do |i|
    # i番目とi+1番目が1であるようにする

    cost = 0
    (0..i).each do |j|
      if (i - j) % 2 == 0
        cost += CS[j] if ss[j] != 1
      else
        cost += CS[j] if ss[j] != 0
      end
    end

    ((i + 1)..(N - 1)).each do |j|
      if (j - (i + 1)) % 2 == 0
        cost += CS[j] if ss[j] != 1
      else
        cost += CS[j] if ss[j] != 0
      end
    end

    cost
  end.min

  [cost_min_0, cost_min_1].min
end


puts calc(S.split('').map(&:to_i))
