require './lib/student'
require 'rspec'

RSpec.describe Student do
  describe '#initialize' do
    it 'exists' do
      student = Student.new({name: "Morgan", age: 21}) 

      expect(student).to be_a Student
    end

    it 'has attributes' do
      student = Student.new({name: "Morgan", age: 21})

      expect(student.name).to eq "Morgan"
      expect(student.age).to eq 21
    end

    it 'can have different attributes' do
      student = Student.new({name: "Jack", age: 25})

      expect(student.name).to eq "Jack"
      expect(student.age).to eq 25
    end

    it 'starts with an empty array for scores' do
      student = Student.new({name: "Morgan", age: 21})
  
      expect(student.scores).to eq []
    end
  end

  describe 'log_scores' do
    it 'stores scores in student scores' do
      student = Student.new({name: "Morgan", age: 21})

      student.log_scores(89)
      student.log_scores(78)

      expect(student.scores).to eq [89, 78]
    end
  end
end