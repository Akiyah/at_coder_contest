H, W, N = gets.chomp.split.map(&:to_i)
AS = gets.chomp.split.map(&:to_i)

AS.sort!.reverse!

def check_one(a, vs)
  d = 2 ** a

  l = vs.length
  (0...l).each do |k|
    # pp "k: #{k}"
    # pp "vs[k]: #{vs[k]}"
    i, j = vs[k]

    if d <= H - i && d <= W - j # 切り取れる場合

      append_vs = []
      if i + d < H
        unless 0 < k && vs[k - 1][0] == i + d
          append_vs << [i + d, j]
        end
      end

      if j + d < W
        unless k < l - 1 && vs[k + 1][1] == j + d
          append_vs << [i, j + d]
        end
      end


      vs0 = vs[0...k]
      vs1 = vs[(k + 1)..-1]
      vs = vs0 + append_vs + vs1

      return true, vs
    end
  end

  return false, []
end

def check()
  vs = [[0, 0]]

  AS.each do |a|
    # pp vs
    r, vs = check_one(a, vs)
    return 'No' unless r
  end

  'Yes'
end


puts check()