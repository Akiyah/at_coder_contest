def fib n
  if n <= 1
    debugger
    1
  else
    fib(n-2) + fib(n-1)
  end
end

p fib(10)
