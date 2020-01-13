require 'find'

# with reference to: The Ruby Way Third Edition by Hal Fulton with Andre Arko
#                    Addison Wesley, 2015, pp 343 - 344, 
# Verifying conversion script location

class MyFindFiles
  def initialize
    @dir = Dir.pwd
  end

  def list_files
    list = []
    Find.find(@dir) do |path|
      Find.prune if [".",".."].include? path
      list << path.gsub(@dir,"")
    end
    list
  end

end

def look_for(target)
  look = MyFindFiles.new.list_files.find { |i| i == target }
  if look == target
    puts "successfully found " + target + "\n"
  else
    puts "could not find " + target + "\n"
    puts "this is bad" + "\n"
  end
end

look_for("/src/main.rb")


