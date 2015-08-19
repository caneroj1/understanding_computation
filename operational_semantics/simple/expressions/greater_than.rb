class GreaterThan < Struct.new(:left, :right)
  def to_s
    "#{left} > #{right}"
  end

  def inspect
    "«#{self}»"
  end

  def reducible?
    true
  end

  def reduce(environment)
    if left.reducible?
      GreaterThan.new(left.reduce(environment), right)
    elsif right.reducible?
      GreaterThan.new(left, right.reduce(env))
    else
      Boolean.new(left.value < right.value)
    end
  end
end
