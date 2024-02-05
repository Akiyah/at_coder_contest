ruby main.rb < input1.txt > actual/actual1.txt
ruby main.rb < input2.txt > actual/actual2.txt
ruby main.rb < input3.txt > actual/actual3.txt
#ruby main.rb < input4.txt > actual/actual4.txt
#ruby main.rb < input5.txt > actual/actual5.txt

diff actual/actual1.txt expected1.txt
diff actual/actual2.txt expected2.txt
diff actual/actual3.txt expected3.txt
#diff actual/actual4.txt expected4.txt
#diff actual/actual5.txt expected5.txt
