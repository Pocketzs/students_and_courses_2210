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
  # The University of Denver would like you to implement additional functionality. 
  # They would like to be able to track all the grades across all courses. 
  # They would also like to be able to find all students across all courses 
  # that have a grade in a given range.
  def list_grades
    grades_by_course = {}
    courses.each do |course|
      grades_by_course[course.name] = course.students.map do |student|
        student.grade
      end
    end
    grades_by_course
  end
end