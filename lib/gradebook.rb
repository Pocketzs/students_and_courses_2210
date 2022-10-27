class Gradebook
  attr_reader :instructor,
              :courses

  def initialize(attributes)
    @instructor = attributes[:instructor]
    @courses = attributes[:courses]
  end

  def list_students
    courses.map do |course|
      course.students
    end.flatten
  end

  def list_students_under_grade(threshold)
    list_students.select do |student|
      student.grade < threshold
    end
  end
end