# (1..1000).each do |n|
#   pp(n:)
#   a_simple = `echo #{n} | ruby main.rb`.chomp
#   a = `echo #{n} | ruby main.rb`.chomp
  
#   pp(n:, a_simple:, a:) if a_simple != a
# end

n = (1..10000).bsearch do |n|
  a_simple = `echo #{n} | ruby main_simple.rb`.chomp
  a = `echo #{n} | ruby main.rb`.chomp
  
  pp(n:, a_simple:, a:, r: a_simple != a)
  a_simple != a
end

pp(n:)