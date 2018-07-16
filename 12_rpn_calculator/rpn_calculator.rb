class RPNCalculator
  attr_accessor :numbers

  def initialize
    @numbers = []
  end  

  def push(n)
    @numbers.push(n)  
  end

  def plus
    @numbers.length > 1 ? @numbers.push(@numbers.pop(2).reduce(:+) ) : fail
  end

  def minus
    @numbers.length > 1 ? @numbers.push(@numbers.pop(2).reduce(:-) ) : fail
  end  

  def divide
    @numbers.length > 1 ? @numbers.push(@numbers.pop(2).inject{|x,y| x.to_f / y} ) : fail
  end

  def times
    @numbers.length > 1 ? @numbers.push(@numbers.pop(2).reduce(:*) ) : fail
  end

  def value
    @value = @numbers[-1]
  end

  def tokens(pol)
    pol.split(' ').map{|n| n.to_i.to_s == n ? n.to_i : n.to_sym}
  end

  def evaluate(pol)
    @numbers = [] 
    opps = {:+ => Proc.new {plus}, :- => Proc.new{minus}, :/ => Proc.new{divide}, :* => Proc.new{times} } 
    tokens(pol).chunk{|n| n.is_a?(Integer)}.each{|e,a| e == true ? a.each{|a| push(a) } : a.each {|o| (opps[o].call) }}
    @numbers[0]
  end

  def fail
    begin
      raise Exception.new("calculator is empty")
    end
  end

end
