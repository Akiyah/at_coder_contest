require 'rblineprof'
require 'rblineprof-report'

# すべてのRubyファイルを対象にする (gemなども計測される)
# target = /./

# カレントディレクトリ以下のRubyファイルを対象にする
target = /#{Dir.pwd}\/./

profile = lineprof(target) do
  h = {}
  1000.times do |i|
    1000.times do |j|
      x = h[i] || 0
      h[i] = x + 1

      x = h[[i]] || 0
      h[[i]] = x + 1

      x = h[[i, i, i]] || 0
      h[[i, i, i]] = x + 1

      x = h[i.to_s] || 0
      h[i.to_s] = x + 1

      x = h["#{i},#{i},#{i}"] || 0
      h["#{i},#{i},#{i}"] = x + 1
      a, b, c = "#{i},#{i},#{i}".split(',')
    end
  end
end
LineProf.report(profile)
