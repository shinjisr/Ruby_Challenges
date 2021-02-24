# demo about include, extend, class_eval and ActiveSupport::Concern
class MyClass
end

MyClass.class_eval do
  def say
    puts 'Hi'
  end
end

a = MyClass.new
a.say

p MyClass.instance_methods(false)

module Move
  def self.included(base)
    base.extend ClassMethods
    base.class_eval do
      def walk
        puts 'Walk'
      end
    end

  end

  module ClassMethods
    def run
      puts 'Run'
    end
  end
end

MyClass.class_eval do
  include Move
end

a.walk

b = MyClass.new
b.walk
b.class.run

# require 'rails'
require 'active_support/concern'

module Fly
  extend ActiveSupport::Concern

  included do
    def slow
      puts 'Fly slow'
    end
  end

  class_methods do
    def fast
      puts 'Class method fast fly'
    end
  end
end


MyClass.class_eval do
  include Fly
end

c = MyClass.new
c.slow
c.class.fast
