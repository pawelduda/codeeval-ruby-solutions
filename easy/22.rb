def fibonacci(n)
  return 0 if n == 0
  return 1 if n == 1
  return fibonacci(n - 1) + fibonacci(n - 2) if n > 1
end

# tests
=begin
p fibonacci(5) == 5
p fibonacci(12) == 144
=end

