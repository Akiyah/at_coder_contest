require 'rblineprof'
require 'rblineprof-report'

# すべてのRubyファイルを対象にする (gemなども計測される)
target = /./

# カレントディレクトリ以下のRubyファイルを対象にする
# target = /#{Dir.pwd}\/./

# profile = lineprof(target) do
#   require './set_test_1.rb'
# end
# LineProf.report(profile)

profile = lineprof(target) do
  require './set_test_2.rb'
end
LineProf.report(profile)
