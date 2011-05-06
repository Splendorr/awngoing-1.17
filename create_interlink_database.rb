#!/usr/bin/env ruby

#class File
#  def self.open_and_extract(*args)
#    f = File.open(*args)
#    yield f
#    f.close()
#  end
#end


pattern = /snip/ 

Dir.glob('./soups/**/*').each do |file|
  next unless File.file?(file)
    File.open(file) do |f|
      f.each_line do |line|
        #if line.match(pattern)
        #  puts $0
        #end
        # or
        #if !(match_data = line.match(pattern)).nil?
        #  puts match_data[0]
        #end
        # or to see multiple matches
        unless (matches = line.scan(pattern)).empty?
          p file
          p matches
        end
    end
  end
end

