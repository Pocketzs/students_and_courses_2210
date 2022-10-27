require './lib/student'
require 'rspec'

RSpec.describe Student do
  describe '#initialize' do
    it 'exists' do
      student = Student.new({name: "Morgan", age: 21}) 

      expect(student).to be_a Student
    end
  end
end