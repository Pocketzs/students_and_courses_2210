require './lib/course'
require './lib/student'
require 'rspec'

describe Course do
  describe '#initialize' do
    it 'exists' do
      course = Course.new("Calculus", 2)

      expect(course).to be_a(Course)
    end
  end
end