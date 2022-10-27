class Student
  attr_reader :name,
              :age,
              :scores 

  def initialize(attributes)
    @name = attributes[:name]
    @age = attributes[:age]
    @scores = []
  end

  def log_scores(value)
    @scores << value
  end

  def grade
    (@scores.sum.to_f/@scores.length).round(1)
  end
end