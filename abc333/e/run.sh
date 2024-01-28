ruby main.rb < input/input1.txt > actual/actual1.txt
ruby main.rb < input/input2.txt > actual/actual2.txt
ruby main.rb < input/input3.txt > actual/actual3.txt

diff actual/actual1.txt expected/expected1.txt
diff actual/actual2.txt expected/expected2.txt
diff actual/actual3.txt expected/expected3.txt
