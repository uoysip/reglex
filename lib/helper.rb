# classes useful for running test cases

# e represents epsilon
# L represents letters
# D represents digits
# Q represents question mark ? in input
# E represents exclamation mark ! in input
# P represents period . in input
# C represents comma , in input
# K represents colon : in input
# M represents minus sign - in input
# A represents addition operator + in input
# B represents binary operators * / % ^ in input
# X represents left parenthesis ( in input
# Y represents right parenthesis ) in input
# S represents assignment operator = in input
# T represents less than operator < in input
# U represents greater than operator > in input
# Z represents anything else
# regular expression operators
# ( opens a regular expression in prefix notation
# ) closes a regular expression in prefix notation
# . represents concatenation of one or more subtrees in regular expression
# + represents the concatenation of one or more copies of the first subtree
# | represents any one of the subtrees

class TreeHolder
   def initialize(tree)
      @tree = tree
   end
   def to_s
      subtrees_string = subtrees_to_s
      if subtrees_string == ""
         @tree.root 
      else
         "(" + @tree.root + subtrees_string + ")"
      end
   end

private

   def subtrees_to_s
      result = ""
      @tree.subtrees.each do | subtree |
         result = result + (TreeHolder.new(subtree).to_s)
      end
      result
   end
end

