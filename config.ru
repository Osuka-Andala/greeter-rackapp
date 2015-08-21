require "greeter"

use Rack::Reloader, 0

run Rack::Greeter.new([Rack::File.new("public"), Greeter])