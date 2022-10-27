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

    it 'can have capacities' do
      course_1 = Course.new("Calculus", 2)
      course_2 = Course.new("History", 3)

      expect(course_1.capacity).to eq(2)
      expect(course_2.capacity).to eq(3)
    end

    it 'starts with an empty array for students' do
      course = Course.new("Calculus", 2)

      expect(course.students).to eq([])
    end
  end

  describe '#full?' do
    it 'returns false until amount of students reaches capacity' do
      course = Course.new("Calculus", 2)
      student1 = Student.new({name: "Morgan", age: 21})
      student2 = Student.new({name: "Jack", age: 25})

      expect(course.full?).to eq(false)

      course.enroll(student1)

      expect(course.full?).to eq(false)

      course.enroll(student2)

      expect(course.full?).to eq(true)
    end
  end

  describe '#enroll' do
    it 'stores student in students array' do
      course = Course.new("Calculus", 2)
      student1 = Student.new({name: "Morgan", age: 21})
      student2 = Student.new({name: "Jack", age: 25})

      course.enroll(student1)
      course.enroll(student2)

      expect(course.students).to eq([student1, student2])
    end

    it 'stops storing studnets when at capacity' do
      course = Course.new("Calculus", 2)
      student1 = Student.new({name: "Morgan", age: 21})
      student2 = Student.new({name: "Jack", age: 25})
      student3 = Student.new({name: "Sarah", age: 35})

      course.enroll(student1)
      course.enroll(student2)

      expect(course.enroll(student3)).to eq nil

      course.enroll(student3)
      
      expect(course.students).to eq([student1, student2])
    end
  end
end