require "rack"

app = proc do |env|
  [200, { "Content-Type" => "text/plain" }, ["Hello"]]
end

Rack::Handler::Thin.run app, :Port => 8090