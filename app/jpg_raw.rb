require 'fileutils'

print "This program sorts through a single directory and sorts photo
files by their extension name into two new directories called JPG and
RAW. Just put the name of the directory you would like to sort."

puts

#user input for directory name
my_directory = gets.chomp

print "You have selected a file called #{my_directory} \n"

#creates a directory object and assigns it to dir_obj
dir_obj = Dir.open(my_directory)


#checks for existence of a directory called Jpegs and creates it if
#it is not found.

if Dir.exist? "#{my_directory}/Jpegs"
  puts "There is already a file called Jpegs. \n"
else
  Dir.mkdir "#{my_directory}/Jpegs"
  puts "File named Jpegs created. \n"
end

#checks for existence of a directory called Raw and creates it if
#it is not found.

if Dir.exist? "#{my_directory}/Raw"
  puts "There is already a file called Raw. \n"
else
  Dir.mkdir "#{my_directory}/Raw"
  puts "File named Raw created. \n"
end

#looks at every file in the directory and sorts them based on their file extension.
#.JPG  into the Jpeg folder, .NEF and .CR2 into the Raw folder. Everything else
# stays in place.

dir_obj.each do |file|
  if File.extname(file) == '.JPG'
    FileUtils.move( "#{my_directory}/#{file}", "#{my_directory}/Jpegs")
  elsif File.extname(file) == '.CR2' || File.extname(file) == '.NEF'
    FileUtils.move("#{my_directory}/#{file}", "#{my_directory}/Raw")
  end
end

# all done!

print "All done."
puts
exit
