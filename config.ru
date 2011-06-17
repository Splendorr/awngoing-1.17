# If you're running your site under a proper webserver, you probably don't need this.
# require 'vanilla/static'
# use Vanilla::Static, File.join(File.dirname(__FILE__), 'public')

# loop through each folder in 'public' and mount it at '/subfolder-name', e.g. '/css' etc.
Dir.chdir('public') do
    public_dirs = (Dir.glob("*").find_all{|entry| File::directory?(entry)}).collect{|dir| '/' + dir}
    use Rack::Static, :urls => public_dirs, :root => 'public'
end

require "application"
run Application.new