require 'rblineprof'
require 'rblineprof-report'

# すべてのRubyファイルを対象にする (gemなども計測される)
# target = /./

# カレントディレクトリ以下のRubyファイルを対象にする
target = /#{Dir.pwd}\/./

profile = lineprof(target) do



  N = 4 * 10 ** 5
  D = 5000


  as = (0...N).to_a
  ais = as.map.with_index { |a, i| [a, i] }

  rs = []
  N.times do |j|
    rs << (as.bsearch_index { |a| a > j } || 0)
  end
  pp(rs) if false
  pp(rs.sum)

  rs = []
  N.times do |j|
    rs << (as.bsearch_index { |a| a - D > j } || 0)
  end
  pp(rs) if false
  pp(rs.sum)

  rs = []
  N.times do |j|
    rs << (ais.bsearch_index { |ai| ai[0] > j } || 0)
  end
  pp(rs) if false
  pp(rs.sum)

  rs = []
  N.times do |j|
    rs << (ais.bsearch_index { |ai| ai[0] - D > j } || 0)
  end
  pp(rs) if false
  pp(rs.sum)

  rs = []
  N.times do |j|
    rs << (ais.bsearch_index { |a, i| a > j } || 0)
  end
  pp(rs) if false
  pp(rs.sum)

  rs = []
  N.times do |j|
    rs << (ais.bsearch_index { |a, i| a - D > j } || 0)
  end
  pp(rs) if false
  pp(rs.sum)


end
LineProf.report(profile)

