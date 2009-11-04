require File.dirname(__FILE__) + '/../../../config/boot'

directory = File.join(RAILS_ROOT, '/vendor/plugins/themes/')

def xcopy(options)
  source  = options[:source]
  dest    = options[:dest]
  logging = options[:logging].nil? ? true : options[:logging]
  
  Dir.foreach(source) do |entry|
    next if entry =~ /^\./
    if File.directory?(File.join(source, entry))
      unless File.exist?(File.join(dest, entry))
        if logging
          puts "Creating directory #{entry}..."
        end
        FileUtils.mkdir File.join(dest, entry)
      end
      xcopy(:source  => File.join(source, entry),
            :dest    => File.join(dest, entry),
            :logging => logging)
    else
      if logging
        puts "  Installing file #{entry}..."
      end
      FileUtils.cp File.join(source, entry), File.join(dest, entry)
    end
  end     
end

puts "** Installing Theme Assets **"
src = File.join(directory, '/assets/')
dst = File.join(RAILS_ROOT, '/public/themes/')
unless File.exists?(dst)
  puts "Creating destination directory..."
  FileUtils.mkdir(dst)
end
xcopy(:source => src, :dest => dst, :logging => true)
puts "** Successfully Installed Theme Assets **"

puts "** Installing Theme Layouts **"
src = File.join(directory, '/templates/')
dst = File.join(RAILS_ROOT, '/app/views/layouts/')
unless File.exists?(dst)
  puts "Creating destination directory..."
  FileUtils.mkdir(dst)
end
xcopy(:source => src, :dest => dst, :logging => true)
puts "** Successfully Installed Theme Layouts **"

puts "** Installing Site Config **"
src = File.join(directory, '/config/')
dst = File.join(RAILS_ROOT, '/config/')
xcopy(:source => src, :dest => dst, :logging => true)
src = File.join(directory, '/initializers/')
dst = File.join(RAILS_ROOT, '/config/initializers/')
xcopy(:source => src, :dest => dst, :logging => true)
puts "** Successfully Installed Site Config **"

puts "** Installing Helpers **"
src = File.join(directory, '/helpers/')
dst = File.join(RAILS_ROOT, '/app/helpers/')
xcopy(:source => src, :dest => dst, :logging => true)
puts "** Successfully Installed Helpers **"

puts IO.read(File.join(directory, 'README.rdoc'))