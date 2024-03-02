V1, V2, V3 = gets.chomp.split.map(&:to_i)

unless V1 + V2 * 2 + V3 * 3 == (7 ** 3) * 3
  puts 'No'
  exit
end



# a1 = b1 = c1 = 0 対称性より仮定
# 0 < a2, b2, c2 対称性より仮定
# a2 >= b2 >= c2 対称性より仮定
# V1とV2は、V1とV3よりも重なっていると仮定する

def calc_v3(a2, b2, c2, a3, b3, c3)
  da = (7 + [0, a2, a3].min) - [0, a2, a3].max
  db = (7 + [0, b2, b3].min) - [0, b2, b3].max
  dc = (7 + [0, c2, c3].min) - [0, c2, c3].max
  if da <= 0 || db <= 0 || dc <= 0
    0
  else
    da * db * dc
  end
end

def calc_v2(a2, b2, c2, a3, b3, c3, v3)
  da1 = (7 + [0, a2].min) - [0, a2].max
  db1 = (7 + [0, b2].min) - [0, b2].max
  dc1 = (7 + [0, c2].min) - [0, c2].max
  v21 = if da1 <= 0 || db1 <= 0 || dc1 <= 0
    0
  else
    da1 * db1 * dc1
  end

  da2 = (7 + [0, a3].min) - [0, a3].max
  db2 = (7 + [0, b3].min) - [0, b3].max
  dc2 = (7 + [0, c3].min) - [0, c3].max
  v22 = if da2 <= 0 || db2 <= 0 || dc2 <= 0
    0
  else
    da2 * db2 * dc2
  end

  da3 = (7 + [a2, a3].min) - [a2, a3].max
  db3 = (7 + [b2, b3].min) - [b2, b3].max
  dc3 = (7 + [c2, c3].min) - [c2, c3].max
  v23 = if da3 <= 0 || db3 <= 0 || dc3 <= 0
    0
  else
    da3 * db3 * dc3
  end

  v21 + v22 + v23 - v3 * 3
end

def calc_v1(v3, v2)
  (7 ** 3) * 3 - v2 * 2 - v3 * 3 
end


(0..7).each do |a2|
  (0..a2).each do |b2|
    (0..b2).each do |c2|
      (-7..14).each do |a3|
        (-7..14).each do |b3|
          (-7..14).each do |c3|
            da = (7 + [0, a2, a3].min) - [0, a2, a3].max
            db = (7 + [0, b2, b3].min) - [0, b2, b3].max
            dc = (7 + [0, c2, c3].min) - [0, c2, c3].max
            v3 = calc_v3(a2, b2, c2, a3, b3, c3)
            v2 = calc_v2(a2, b2, c2, a3, b3, c3, v3)
            v1 = calc_v1(v3, v2)
            # pp [v1, v2, v3]
            if v1 == V1 && v2 == V2 && v3 == V3
              puts 'Yes'
              puts [0, 0, 0, a2, b2, c2, a3, b3, c3].join(' ')
              exit
            end
          end
        end
      end
    end
  end
end


