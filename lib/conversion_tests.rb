require_relative "helper"
require_relative "../src/main"

@total = 0
@pass = 0
def assert(message, test)
   @total = @total + 1
   if test then
      @pass = @pass + 1
      puts "success: " + message
   else
      puts "failed: " + message
   end
end

@total = 0
@pass = 0

test_case = "(.(|LD)D(|LD(.DQ)))"
assert("can handle (.(|LD)D(|LD(.DQ)))",
       TreeHolder.new(PrefixToTree.new(test_case).to_tree).to_s == test_case)


puts @pass.to_s + " passed out of " + @total.to_s + " tests."
