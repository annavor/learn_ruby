class Array
  def sum
    inject(0, &:+)
  end
  def square
    map { |x| x * x }
  end
  def square!
    map! { |x| x * x }
  end
end
