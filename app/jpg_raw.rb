require 'fileutils'

print "This program sorts through a single directory and sorts photo
files by their extension name into two new directories called JPG and
RAW. Just put the name of the directory you would like to sort."

puts

my_directory = gets.chomp

print "You have selected a file called #{my_directory} \n"

r = Dir.open(my_directory)

if Dir.exist? "#{my_directory}/Jpegs"
  puts "There is already a file called Jpegs. \n"
else
  Dir.mkdir "#{my_directory}/Jpegs"
  puts "File named Jpegs created. \n"
end

if Dir.exist? "#{my_directory}/Raw"
  puts "There is already a file called Raw. \n"
else
  Dir.mkdir "#{my_directory}/Raw"
  puts "File named Raw created. \n"
end

r.each do |file|
  if File.extname(file) == '.JPG'
    FileUtils.move( "#{my_directory}/#{file}", "#{my_directory}/Jpegs")
  elsif File.extname(file) == '.CR2' || File.extname(file) == '.NEF'
    FileUtils.move("#{my_directory}/#{file}", "#{my_directory}/Raw")
  end
end


print "All done."
puts
exit
