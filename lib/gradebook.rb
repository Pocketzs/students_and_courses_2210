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
end