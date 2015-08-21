require "erb"


class Greeter

 def self.call(env)
		new(env).response.finish
		# called finish so that it gets returned, 
		# converting it to the array format that rack expects		
 end

 def initialize(env)
    # [200, {"Content-Type" => "text/plain"}, ["Hello Rack"]]
     @request = Rack::Request.new(env)
     # defined the request instance 
     # so that it does not persist between requests
 end

 def response
     case @request.path
     when "/" then Rack::Response.new(render("index.html.erb"))
     when "/change" 
     	 Rack::Response.new do |response|
     	 	response.set_cookie("greet", @request.params["name"])
     	 	response.redirect("/")
     	 end
     else Rack::Response.new("Not Found", 404)	
     end
     
 end


 def render(template)
	path = File.expand_path("../views/#{template}", __FILE__)
	ERB.new(File.read(path)).result(binding)
	
 end

 def greet_name
 	@request.cookies["greet"] || "World"	
 end

end