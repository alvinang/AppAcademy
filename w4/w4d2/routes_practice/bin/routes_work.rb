require 'addressable/uri'
require 'rest-client'


def show_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/2',
    query_values: {}
  ).to_s
  puts RestClient.get(url)
end

def create_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.json'
  ).to_s

  puts RestClient.post(
    url,
    { :user => { :name => "Gizmo", :email => "gizmo@gizmo.gizmo"} }
  )
end

def update_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/2'
  ).to_s

  puts RestClient.put(
    url,
    { :user => { :name => "Gizmo", :email => "gizmo-real@gizmo.gizmo"} }
  )
end

def delete_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/2'
  ).to_s

  puts RestClient.delete(url)
end


# create_user
show_user
#update_user
#delete_user