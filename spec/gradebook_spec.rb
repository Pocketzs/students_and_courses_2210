require './lib/gradebook'
require './lib/course'
require './lib/student'
require 'rspec'

describe Gradebook do
  describe '#initialize' do
    it 'exists' do
      calculus = Course.new("Calculus", 2)
      geometry = Course.new("Geometry", 3)
      gradebook = Gradebook.new({instructor: "McDaniels", courses: [calculus, geometry]})

      expect(gradebook).to be_a Gradebook
    end

    it 'can have different instructors' do
      calculus = Course.new("Calculus", 2)
      geometry = Course.new("Geometry", 3)
      gradebook1 = Gradebook.new({instructor: "McDaniels", courses: [calculus, geometry]})
      gradebook2 = Gradebook.new({instructor: "Lawrence", courses: [calculus, geometry]})

      expect(gradebook1.instructor).to eq "McDaniels"
      expect(gradebook2.instructor).to eq "Lawrence"
    end

    it 'can have different courses' do
      calculus = Course.new("Calculus", 2)
      geometry = Course.new("Geometry", 3)
      history = Course.new("History", 10)
      chemistry = Course.new("Chemistry", 1)
      gradebook1 = Gradebook.new({instructor: "McDaniels", courses: [calculus, geometry]})
      gradebook2 = Gradebook.new({instructor: "Lawrence", courses: [history, chemistry]})

      expect(gradebook1.courses).to eq [calculus, geometry]
      expect(gradebook2.courses).to eq [history, chemistry]
    end
  end

  describe '#list students' do
    it 'can list all the students in its courses' do
      student1 = Student.new({name: "Morgan", age: 21})
      student2 = Student.new({name: "Jack", age: 25})
      student3 = Student.new({name: "Joey", age: 22})
      student4 = Student.new({name: "Christine", age: 26})
      calculus = Course.new("Calculus", 2)
      geometry = Course.new("Geometry", 3)
      history = Course.new("History", 10)
      chemistry = Course.new("Chemistry", 1)

      calculus.enroll(student1)
      calculus.enroll(student2)
      geometry.enroll(student3)
      history.enroll(student4)

      gradebook = Gradebook.new({instructor: "McDaniels", courses: [calculus, geometry, history, chemistry]})
      
      expect(gradebook.list_students).to eq [student1, student2, student3, student4]
    end
  end
end