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

  describe '#list_students' do
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

  describe '#list_students_under_grade' do
    it 'can list all students with a grade below a given threshold' do
      student1 = Student.new({name: "Morgan", age: 21})
      student2 = Student.new({name: "Jack", age: 25})
      student3 = Student.new({name: "Joey", age: 22})
      student4 = Student.new({name: "Christine", age: 26})
      student1.log_scores(90)
      student2.log_scores(80)
      student3.log_scores(70)
      student4.log_scores(60)
      history = Course.new("History", 10)
      history.enroll(student1)
      history.enroll(student2)
      history.enroll(student3)
      history.enroll(student4)
      gradebook = Gradebook.new({instructor: "McDaniels", courses: [history]})

      expect(gradebook.list_students_under_grade(91)).to eq [student1, student2, student3, student4]
      expect(gradebook.list_students_under_grade(90)).to eq [student2, student3, student4]
      expect(gradebook.list_students_under_grade(80)).to eq [student3, student4]
      expect(gradebook.list_students_under_grade(70)).to eq [student4]
      expect(gradebook.list_students_under_grade(60)).to eq []
    end
  end

  describe '#list_grades' do
    it 'tracks all grades across all courses' do
      student1 = Student.new({name: "Morgan", age: 21})
      student2 = Student.new({name: "Jack", age: 25})
      student3 = Student.new({name: "Joey", age: 22})
      student4 = Student.new({name: "Christine", age: 26})
      student1.log_scores(90)
      student2.log_scores(80)
      student3.log_scores(70)
      student4.log_scores(60)
      history = Course.new("History", 10)
      calculus = Course.new("Calculus", 3)
      geometry = Course.new("Geometry", 2)
      chemistry = Course.new("Chemistry", 1)
      history.enroll(student1)
      history.enroll(student2)
      geometry.enroll(student3)
      calculus.enroll(student4)

      gradebook = Gradebook.new({instructor: "McDaniels", courses: [history, geometry, chemistry, calculus]})
      
      expect(gradebook.list_grades).to eq({
                                            "History" => [90.0, 80.0], 
                                            "Geometry" =>[70.0], 
                                            "Calculus" =>[60.0], 
                                            "Chemistry" =>[]
                                          })
    end
  end

  describe '#find_students_in_grade_range' do
    it 'finds all students in a given grade range' do
      student1 = Student.new({name: "Morgan", age: 21})
      student2 = Student.new({name: "Jack", age: 25})
      student3 = Student.new({name: "Joey", age: 22})
      student4 = Student.new({name: "Christine", age: 26})
      student1.log_scores(90)
      student2.log_scores(80)
      student3.log_scores(70)
      student4.log_scores(60)
      history = Course.new("History", 10)
      calculus = Course.new("Calculus", 3)
      geometry = Course.new("Geometry", 2)
      chemistry = Course.new("Chemistry", 1)
      history.enroll(student1)
      history.enroll(student2)
      geometry.enroll(student3)
      calculus.enroll(student4)

      gradebook = Gradebook.new({instructor: "McDaniels", courses: [history, geometry, chemistry, calculus]})

      expect(gradebook.find_students_in_grade_range(60,80)).to eq([student2, student3, student4])
      expect(gradebook.find_students_in_grade_range(70,90)).to eq([student1, student2, student3])
      expect(gradebook.find_students_in_grade_range(91,100)).to eq([])
    end
  end
end