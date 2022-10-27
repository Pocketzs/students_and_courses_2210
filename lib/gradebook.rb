class Gradebook
  attr_reader :instructor,
              :courses
  def initialize(attributes)
    @instructor = attributes[:instructor]
    @courses = attributes[:courses]
  end
end