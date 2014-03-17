require 'spec_helper'
require 'dp'

require 'rspec/expectations'

RSpec::Matchers.define :soon_be do |expected|
  match do |actual|
    java_import 'scala.concurrent.duration.Duration'
    res = Ruf::Await.result(actual, Duration.apply(5000, "millis"))
    res ==  expected
  end
end


describe Ruf do
  after do
    Ruf::shutdown
  end

  it 'should have a version number' do
    Ruf::VERSION.should_not be_nil
  end

  describe 'future' do
    it 'should accept lambdas' do
      f = Ruf::future lambda { sleep 0.5; 3 }
      f.should soon_be(3)
    end

    it 'should accept blocks' do
      f = Ruf::future { sleep 0.5; 5 }
      f.should soon_be(5)
    end
  end
end

