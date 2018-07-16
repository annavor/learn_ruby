def add num1, num2
  num1 + num2
end

def subtract num1, num2
  num1 - num2
end

def sum(array)
  total = 0
  array.each{ |item| total += item }
  total
end

def multiply(*nums)
  nums == [] ? total = 0 : total = 1
  nums.each{ |item| total *= item }
  total
end

def power(num1, num2)
  num1 ** num2
end

def add num1, num2
  num1 + num2
end

def subtract num1, num2
  num1 - num2
end

def sum(array)
  array.sum
end

def multiply(num1, num2, *arrays)
  num1*num2*array.reduce(:*)
end

def power(num1, num2)
  num1 ** num2
end

def factorial(num)
  (1..num).reduce(:*)
end
