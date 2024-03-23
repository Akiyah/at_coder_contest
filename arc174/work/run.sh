ruby main.rb < input1.txt > actual/actual1.txt
ruby main.rb < input2.txt > actual/actual2.txt
# ruby main.rb < input3.txt > actual/actual3.txt

diff actual/actual1.txt expected1.txt
diff actual/actual2.txt expected2.txt
# diff actual/actual3.txt expected3.txt
