require "erb"


class Greeter

 def call(env)
    # [200, {"Content-Type" => "text/plain"}, ["Hello Rack"]]
     Rack::Response.new(render("index.html.erb"))
 end


 def render(template)
	path = File.expand_path("../views/#{template}", __File__)
	ERB.new(File.read(path)).result(binding)
	
 end
 
end