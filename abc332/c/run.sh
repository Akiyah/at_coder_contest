ruby main.rb < input/input1.txt > actual/actual1.txt
ruby main.rb < input/input2.txt > actual/actual2.txt
ruby main.rb < input/input3.txt > actual/actual3.txt
ruby main.rb < input/input4.txt > actual/actual4.txt
ruby main.rb < input/input5.txt > actual/actual5.txt

diff actual/actual1.txt expected/expected1.txt
diff actual/actual2.txt expected/expected2.txt
diff actual/actual3.txt expected/expected3.txt
diff actual/actual4.txt expected/expected4.txt
diff actual/actual5.txt expected/expected5.txt
