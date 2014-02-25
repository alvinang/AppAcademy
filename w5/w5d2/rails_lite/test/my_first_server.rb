require 'webrick'

server = WEBrick::HTTPServer.new Port: 8080
trap('INT') { server.shutdown }

server.mount_proc '/' do |req, res|
  res['Content-Type'] = 'text/text'
  res.status = 200
  res.body = req.to_s
end

server.start