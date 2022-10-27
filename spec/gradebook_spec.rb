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
end