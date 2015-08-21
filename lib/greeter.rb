class Greeter

 def call(env)
    # [200, {"Content-Type" => "text/plain"}, ["Hello Rack"]]
     Rack::Response.new("Hello")
 end

end