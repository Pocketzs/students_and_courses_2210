class Course
  attr_reader :name,
              :capacity,
              :students

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @students = []
  end

  def enroll(studnet)
    @students << studnet unless full?
  end

  def full?
    @students.size == @capacity
  end
end