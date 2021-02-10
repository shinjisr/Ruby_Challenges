# =============================
# Ref: <https://stackoverflow.com/questions/4470108/when-monkey-patching-an-instance-method-can-you-call-the-overridden-method-from>
# Inheritance
# =============================

# # So, if at all possible, you should prefer something like this:
# class Foo
  # def bar
    # 'Hello'
  # end
# end 

# class ExtendedFoo < Foo
  # def bar
    # super + ' World'
  # end
# end

# ExtendedFoo.new.bar # => 'Hello World'

# =============================
# Mixin Inheritance (broken)
# =============================
# class Foo
  # def bar
    # 'Hello'
  # end
# end 

# module FooExtensions
  # def bar
    # super + ' World'
  # end
# end

# class Foo
  # include FooExtensions
# end

# # Module#include inserts the mixin above the class in the inheritance hierarchy
# p Foo.new.bar # => Hello

# =============================
# "Dirty" Monkey Patching
# `alias_method` chain
# =============================
# class Foo
  # def bar
    # 'Hello'
  # end
# end 

# class Foo
  # alias_method :old_bar, :bar

  # def bar
    # old_bar + ' World'
  # end
# end

# p Foo.new.bar # => 'Hello World'
# p Foo.new.old_bar # => 'Hello'

# =============================
# An aside: Refinements
# Ref: <http://ruby-doc.org/core/doc/syntax/refinements_rdoc.html>
# =============================
class Foo
  def bar
    'Hello'
  end
end 

module ExtendedFoo
  module FooExtensions
    def bar
      super + ' World'
    end
  end

  refine Foo do
    prepend FooExtensions
  end
end

p Foo.new.bar # => 'Hello'
# We haven’t activated our Refinement yet!

using ExtendedFoo
# Activate our Refinement

p Foo.new.bar # => 'Hello World'
# There it is!
