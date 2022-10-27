require './lib/course'
require './lib/student'
require 'rspec'

describe Course do
  describe '#initialize' do
    it 'exists' do
      course = Course.new("Calculus", 2)

      expect(course).to be_a(Course)
    end

    it 'can have names' do
      course_1 = Course.new("Calculus", 2)
      course_2 = Course.new("History", 3)

      expect(course_1.name).to eq("Calculus")
      expect(course_2.name).to eq("History")
    end
  end
end