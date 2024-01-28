n = gets.chomp.to_i
data = (1..n).map do
  gets.chomp.split(' ').map(&:to_i)
end
gets.chomp.split('').each_with_index do |s, i|
  data[i] << s
end

#pp data

def check(data)

  data_by_y = data.group_by { |d| d[1] }

  data_by_y.each do |y, ds|
    ds_r = ds.select { |d| d[2] == 'R' }
    ds_l = ds.select { |d| d[2] == 'L' }

    next if ds_r.empty?
    next if ds_l.empty?

    r_min = ds_r.map { |d| d[0] }.min
    l_max = ds_l.map { |d| d[0] }.max

    return true if r_min < l_max

#    ds.each_with_index do |d, i|
#      next if i == d.length - 1
#  
#      ds[(i + 1)..-1].each do |d2|
#        #pp [d, d2]
#        next unless d[1] == d2[1] # y座標が同じでない場合
#        next if d[2] == d2[2] # 移動方向が同じ場合
#  
#        return true if d[2] == 'R' && d[0] < d2[0]
#        return true if d[2] == 'L' && d2[0] < d[0]
#      end
#    end

  end

  false
end

puts check(data) ? 'Yes' : 'No'
